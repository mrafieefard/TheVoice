import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:the_voice_client/the_voice_client.dart';

Query<List<ChannelModel>> getChannelsQuery(String serverAddress) {
  return Query(
    key: "channel_list_$serverAddress",
    queryFn: () async {
      final api = TheVoiceClient(basePathOverride: serverAddress);
      final channels = await api.getChannelsApi().getChannelsApiChannelsGet();
    
      return channels.data!.toList();
    },
  );
}

Query<List<CategoryModel>> getCategoriesQuery(String serverAddress) {
  return Query(
    key: "categories_list_$serverAddress",
    queryFn: () async {
      final api = TheVoiceClient(basePathOverride: serverAddress);
      final categories = await api.getCategoriesApi().getCategoriesApiCategoriesGet();
    
      return categories.data!.toList();
    },
  );
}

Query<(List<ChannelModel>, List<CategoryModel>)> getChannelsAndCategoriesQuery(String serverAddress) {
  return Query(
    key: "channels_and_categories_$serverAddress",
    queryFn: () async {
      final api = TheVoiceClient(basePathOverride: serverAddress);
      final channels = await api.getChannelsApi().getChannelsApiChannelsGet();
      final categories = await api.getCategoriesApi().getCategoriesApiCategoriesGet();
    
      return (channels.data!.toList(), categories.data!.toList());
    },
  );
}