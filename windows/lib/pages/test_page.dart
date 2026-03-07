import 'dart:math';
import 'dart:typed_data';

import 'package:application/client/voice_client.dart';
import 'package:application/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:record/record.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool _isMute = false;
  final record = AudioRecorder();
  final _voiceClient = VoiceClient();
  Stream<Uint8List>? _audioStream;
  AudioSource? _playbackAudioSource;

  // Voice activity detection
  static const double _voiceThreshold = 0.01; // Adjust as needed (0.0 - 1.0)
  static const int _silenceFrames =
      5; // Frames of silence before stopping transmission
  int _currentSilenceFrames = 0;

  void initiateVoice() async {
    _voiceClient.connect();
    await SoLoud.instance.init();

    // Create a single audio source for continuous playback with minimal buffering
    _playbackAudioSource = SoLoud.instance.setBufferStream(
      bufferingType: BufferingType.preserved,
      sampleRate: 48000, // Lower sample rate for voice (reduces latency)
      channels: Channels.stereo, // Mono is sufficient for voice
      format: BufferType.s16le,
      bufferingTimeNeeds: 0
    );

    // Start playing the audio source immediately
    SoLoud.instance.play(_playbackAudioSource!);

    _audioStream = await record.startStream(
      const RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        sampleRate: 48000, // Match playback sample rate
        numChannels: 2, // Match playback channels (mono)
      ),
    );

    _audioStream!.listen((data) {
      if (_isMute) return;
      if (data.isEmpty) return;

      // Check if user is talking (voice activity detection)
      if (_isVoiceDetected(data)) {
        _currentSilenceFrames = 0;
        // Send audio data only when voice is detected
        _voiceClient.sendAudioData(data);
      } else {
        _currentSilenceFrames++;
        // Send a few more frames after voice stops to avoid cutting off speech
        if (_currentSilenceFrames <= _silenceFrames) {
          _voiceClient.sendAudioData(data);
        }
        // If silence continues, stop sending packets
      }
    });

    _voiceClient.onAudioDataReceived = (response) async {
      // Add incoming audio chunks to the existing audio source
      if (_playbackAudioSource != null) {
        SoLoud.instance.addAudioDataStream(_playbackAudioSource!, response);
      }
    };
  }

  void stopVoice() async {
    // Stop recording
    if (await record.isRecording()) {
      await record.stop();
    }

    // Stop and cleanup audio playback
    if (_playbackAudioSource != null) {
      SoLoud.instance.setDataIsEnded(_playbackAudioSource!);
      _playbackAudioSource = null;
    }

    // Disconnect client
    _voiceClient.disconnect();
  }

  /// Detects voice activity by analyzing audio amplitude
  bool _isVoiceDetected(Uint8List audioData) {
    if (audioData.length < 2) return false;

    // Calculate RMS (Root Mean Square) for amplitude detection
    double sum = 0.0;
    int samples = audioData.length ~/ 2; // 16-bit samples (2 bytes per sample)

    for (int i = 0; i < audioData.length - 1; i += 2) {
      // Convert bytes to 16-bit signed integer
      int sample = (audioData[i + 1] << 8) | audioData[i];
      if (sample > 32767) sample -= 65536; // Convert to signed

      double normalizedSample = sample / 32768.0; // Normalize to [-1, 1]
      sum += normalizedSample * normalizedSample;
    }

    double rms = sqrt(sum / samples);
    return rms > _voiceThreshold;
  }

  @override
  void initState() {
    super.initState();
    initiateVoice();
  }

  @override
  void dispose() {
    stopVoice();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button(
          icon: Icon(
            _isMute ? LucideIcons.micOff : LucideIcons.mic,
            color: _isMute ? Colors.white : Colors.black,
            size: 16,
          ),
          height: 32,
          onPressed: () {
            setState(() => _isMute = !_isMute);
          },
          textStyle: TextStyle(color: _isMute ? Colors.white : Colors.black),
          backgroundColor: _isMute ? Colors.redAccent : Colors.white,
        ),
      ),
    );
  }
}
