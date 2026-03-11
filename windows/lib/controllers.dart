import 'dart:typed_data';

import 'package:application/client/voice_client.dart';
import 'package:application/utils.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:record/record.dart';

final storage = GetStorage();

class ServersController extends GetxController {
  RxList<SavedServer> servers = [].cast<SavedServer>().obs;

  @override
  void onInit() async {
    final storedServers = storage.read("servers");
    if (storedServers != null) {
      servers.value = List<SavedServer>.from(
        (storedServers as List).map((s) => SavedServer.fromJson(s)),
      );
    } else {
      servers.value = [];
    }

    super.onInit();
  }

  Future<void> addServer(SavedServer information) async {
    servers.add(information);
    await storage.write("servers", [...servers.map((s) => s.toJson())]);
  }

  Future<void> removeServer(String id) async {
    final information = servers.firstWhere((s) => s.id == id);
    servers.remove(information);
    storage.write("servers", servers);
  }

  SavedServer getServer(String id) {
    return servers.firstWhere((s) => s.id == id);
  }
}

class VoiceController extends GetxController {
  RxBool isMuted = false.obs;
  RxBool isDeafened = false.obs;
  RxBool isConnected = false.obs;

  final soloud = SoLoud.instance;
  final record = AudioRecorder();

  final voiceClient = VoiceClient();

  @override
  void onInit() async {
    await SoLoud.instance.init();

    super.onInit();
  }

  bool toggleMute() {
    isMuted.value = !isMuted.value;
    if (!isMuted.value) {
      isDeafened.value = false;
    }
    return isMuted.value;
  }

  bool toggleDeafen() {
    isDeafened.value = !isDeafened.value;
    if (isDeafened.value) {
      isMuted.value = true;
    } else {
      isMuted.value = false;
    }
    return isDeafened.value;
  }

  Future<void> connect(String serverAddress) async {
    if (voiceClient.isConnected) return;
    Uri uri = Uri.parse(serverAddress);

    int _currentSilenceFrames = 0;

    final AudioSource _playbackAudioSource = soloud.setBufferStream(
      bufferingType: BufferingType.preserved,
      sampleRate: 48000,
      channels: Channels.stereo,
      format: BufferType.s16le,
      bufferingTimeNeeds: 0,
    );

    soloud.play(_playbackAudioSource);

    Stream<Uint8List> _audioStream = await record.startStream(
      const RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        sampleRate: 48000,
        numChannels: 2,
      ),
    );

    _audioStream.listen((data) {
      if (isMuted.value) return;
      if (data.isEmpty) return;

      if (isVoiceDetected(data)) {
        _currentSilenceFrames = 0;
        voiceClient.sendAudioData(data);
      } else {
        _currentSilenceFrames++;
        if (_currentSilenceFrames <= 5) {
          voiceClient.sendAudioData(data);
        }
      }
    });
    
    await voiceClient.connect(host: uri.host);

    voiceClient.onAudioDataReceived = (response) async {
      if (!isDeafened.value) {
        soloud.addAudioDataStream(_playbackAudioSource, response);
      }
    };

    isConnected.value = voiceClient.isConnected;
  }

  Future<void> disconnect() async {
    voiceClient.disconnect();
    isConnected.value = voiceClient.isConnected;
  }
}
