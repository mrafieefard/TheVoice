import 'package:dio/dio.dart';
import 'package:the_voice_client/the_voice_client.dart';

class ApiRepository {
  late final TheVoiceClient api;
  final Dio dio = Dio();
  String _baseUrl;

  ApiRepository({String baseUrl = 'http://localhost:8000'})
    : _baseUrl = baseUrl {
    _configureDio();
    api = TheVoiceClient(dio: dio);
  }

  void _configureDio() {
    dio.options = dio.options.copyWith(
      baseUrl: _baseUrl,
      headers: {'Accept': 'application/json'},
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    );
  }

  String get baseUrl => _baseUrl;

  void changeBaseUrl(String newBaseUrl) {
    _baseUrl = newBaseUrl;
    _configureDio();
  }

  void changeAccessToken(String accessToken) {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }
}
