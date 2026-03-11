import 'package:test/test.dart';
import 'package:the_voice_client/the_voice_client.dart';

/// tests for ChannelsApi
void main() {
  final instance = TheVoiceClient().getChannelsApi();

  group(ChannelsApi, () {
    // Create Channel
    //
    //Future<ChannelModel> createChannelApiChannelsPost(ChannelPayload channelPayload) async
    test('test createChannelApiChannelsPost', () async {
      // TODO
    });

    // Get Channels
    //
    //Future<BuiltList<ChannelModel>> getChannelsApiChannelsGet() async
    test('test getChannelsApiChannelsGet', () async {
      // TODO
    });
  });
}
