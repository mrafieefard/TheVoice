import 'package:test/test.dart';
import 'package:the_voice_client/the_voice_client.dart';

/// tests for DefaultApi
void main() {
  final instance = TheVoiceClient().getDefaultApi();

  group(DefaultApi, () {
    // Create Category
    //
    //Future<CategoryModel> createCategoryApiCategoriesPost(CategoryPayload categoryPayload) async
    test('test createCategoryApiCategoriesPost', () async {
      // TODO
    });

    // Create Channel
    //
    //Future<ChannelModel> createChannelApiChannelsPost(ChannelPayload channelPayload) async
    test('test createChannelApiChannelsPost', () async {
      // TODO
    });

    // Get Categories
    //
    //Future<BuiltList<CategoryModel>> getCategoriesApiCategoriesGet() async
    test('test getCategoriesApiCategoriesGet', () async {
      // TODO
    });

    // Get Channels
    //
    //Future<BuiltList<ChannelModel>> getChannelsApiChannelsGet() async
    test('test getChannelsApiChannelsGet', () async {
      // TODO
    });

    // Get Information
    //
    //Future<InformationModel> getInformationApiInformationGet() async
    test('test getInformationApiInformationGet', () async {
      // TODO
    });

    // Health Check
    //
    // Health check endpoint
    //
    //Future<JsonObject> healthCheckApiHealthGet() async
    test('test healthCheckApiHealthGet', () async {
      // TODO
    });
  });
}
