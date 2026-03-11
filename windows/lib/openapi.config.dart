// Openapi Generator last run: : 2026-03-11T18:15:00.439267
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: DioProperties(
    pubName: 'the_voice_client',
    pubAuthor: 'Mohammad Rafieefard',
  ),
  inputSpec: RemoteSpec(
    path: 'http://localhost:8000/openapi.json',
  ),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'the_voice_client',
)
class TheVoiceOpenapi {}