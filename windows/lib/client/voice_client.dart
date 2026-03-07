import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class VoiceClient {
  RawDatagramSocket? _socket;
  Timer? _heartbeatTimer;
  bool _isConnected = false;
  String _serverHost = '128.140.7.174';
  int _serverPort = 8888;

  // Callback for when data is received from server
  Function(Uint8List)? onDataReceived;

  Function(Uint8List)? onAudioDataReceived;

  // Callback for connection status changes
  Function(bool)? onConnectionChanged;

  /// Gets the current connection status
  bool get isConnected => _isConnected;

  /// Gets the server host
  String get serverHost => _serverHost;

  /// Gets the server port
  int get serverPort => _serverPort;

  /// Initializes and connects to the voice server
  Future<bool> connect({String host = '128.140.7.174', int port = 8888}) async {
    try {
      _serverHost = host;
      _serverPort = port;

      // Bind socket to any IPv4 address on a random port
      _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

      // Listen for incoming data
      _socket!.listen((event) {
        if (event == RawSocketEvent.read) {
          final datagram = _socket!.receive();
          if (datagram != null) {
            if (datagram.data.length >= 11 &&
                utf8.decode(datagram.data.sublist(0, 11)) == 'VOICE_DATA:') {
              // Extract audio data after the prefix
              final audioData = datagram.data.sublist(11);
              onAudioDataReceived?.call(audioData);
            } else {
              onDataReceived?.call(datagram.data);
            }
          }
        }
      });

      _isConnected = true;
      onConnectionChanged?.call(_isConnected);

      // Start heartbeat timer
      _startHeartbeat();

      return true;
    } catch (e) {
      print('Failed to connect VoiceClient: $e');
      _isConnected = false;
      onConnectionChanged?.call(_isConnected);
      return false;
    }
  }

  /// Builds a voice packet with the VOICE_DATA prefix
  Uint8List buildVoicePacket(Uint8List audioData) {
    final prefix = utf8.encode('VOICE_DATA:');
    final packet = Uint8List(prefix.length + audioData.length);

    packet.setRange(0, prefix.length, prefix);
    packet.setRange(prefix.length, packet.length, audioData);

    return packet;
  }

  /// Sends audio data to the server
  bool sendAudioData(Uint8List audioData) {
    if (!_isConnected || _socket == null) {
      print('VoiceClient: Cannot send data - not connected');
      return false;
    }

    try {
      final packet = buildVoicePacket(audioData);
      final bytesSent = _socket!.send(
        packet,
        InternetAddress(_serverHost),
        _serverPort,
      );
      return bytesSent > 0;
    } catch (e) {
      print('VoiceClient: Failed to send audio data: $e');
      return false;
    }
  }

  /// Sends a text message to the server
  bool sendMessage(String message) {
    if (!_isConnected || _socket == null) {
      print('VoiceClient: Cannot send message - not connected');
      return false;
    }

    try {
      final data = utf8.encode(message);
      final bytesSent = _socket!.send(
        data,
        InternetAddress(_serverHost),
        _serverPort,
      );
      return bytesSent > 0;
    } catch (e) {
      print('VoiceClient: Failed to send message: $e');
      return false;
    }
  }

  /// Starts the heartbeat timer to send ping messages every 10 seconds
  void _startHeartbeat() {
    _stopHeartbeat(); // Stop any existing timer
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _sendPing();
    });
  }

  /// Stops the heartbeat timer
  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
  }

  /// Sends a ping message to keep the connection alive
  void _sendPing() {
    if (_isConnected) {
      sendMessage('PING');
    } else {
      _stopHeartbeat();
    }
  }

  /// Disconnects from the server and cleans up resources
  void disconnect() {
    _stopHeartbeat();

    if (_socket != null) {
      _socket!.close();
      _socket = null;
    }

    _isConnected = false;
    onConnectionChanged?.call(_isConnected);
  }

  /// Disposes of the client and all resources
  void dispose() {
    disconnect();
    onDataReceived = null;
    onAudioDataReceived = null;
    onConnectionChanged = null;
  }
}
