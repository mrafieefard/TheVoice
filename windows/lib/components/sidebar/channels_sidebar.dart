import 'package:application/client/queries.dart';
import 'package:application/components/sidebar/category_item.dart';
import 'package:application/components/sidebar/channel_item.dart';
import 'package:application/controllers.dart';
import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:the_voice_client/the_voice_client.dart';

class ChannelsSidebar extends StatefulWidget {
  const ChannelsSidebar({super.key});

  @override
  State<ChannelsSidebar> createState() => _ChannelsSidebarState();
}

class _ChannelsSidebarState extends State<ChannelsSidebar> {
  @override
  Widget build(BuildContext context) {
    final serverId = GoRouter.of(context).state.pathParameters["serverId"];
    final serversController = Get.find<ServersController>();
    final server = serversController.getServer(serverId!);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white24, width: 1)),
        ),
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white24, width: 1),
                ),
              ),
              child: Text(
                server.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: QueryBuilder(
                query: getChannelsAndCategoriesQuery(server.address),
                builder: (context, query) {
                  if (query.isLoading || query.data == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final channels = query.data!.$1;
                  final categories = query.data!.$2;
                  final channelsByCategory = <String?, List<ChannelModel>>{};
                  for (var category in categories) {
                    channelsByCategory[category.id] = [];
                  }
                  for (var channel in channels) {
                    channelsByCategory
                        .putIfAbsent(channel.categoryId, () => [])
                        .add(channel);
                  }

                  return ListView(
                    children: [
                      for (var category in categories) ...[
                        CategoryItem(
                          name: category.name,
                          channels: channelsByCategory[category.id] ?? [],
                          server: server,
                        ),
                      ],
                      // Channels without a category
                      if (channelsByCategory.containsKey(null)) ...[
                        for (var channel in channelsByCategory[null]!)
                          ChannelItem(channel: channel, server: server),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
