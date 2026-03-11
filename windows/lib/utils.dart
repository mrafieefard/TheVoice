import 'dart:math';
import 'dart:typed_data';

class SavedServer {
  final String id;
  final String name;
  final String version;
  final String? serverIcon;
  final String description;
  final String address;

  Map<String, String?> toJson() => {
    "id": id,
    "name": name,
    "version": version,
    "server_icon": serverIcon ?? null,
    "description": description,
    "address": address,
  };

  SavedServer.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"],
      version = json["version"],
      serverIcon = json["server_icon"],
      description = json["description"],
      address = json["address"];

  SavedServer({
    required this.id,
    required this.name,
    required this.version,
    required this.serverIcon,
    required this.description,
    required this.address,
  });
}

bool isVoiceDetected(Uint8List audioData, {double voiceThreshold = 0.01}) {
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
    return rms > voiceThreshold;
  }
