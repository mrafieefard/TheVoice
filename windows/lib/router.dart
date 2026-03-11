import 'package:application/pages/main_page.dart';
import 'package:application/pages/server_page.dart';
import 'package:application/pages/text_channel_page.dart';
import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomePage()),
        GoRoute(
          path: '/server/:serverId',
          builder: (context, state) {
            final serverId = state.pathParameters['serverId'];
            return ServerPage(serverId: serverId!);
          },
        ),
        GoRoute(
          path: '/server/:serverId/channel/:channelId',
          builder: (context, state) {
            final serverId = state.pathParameters['serverId'];
            final channelId = state.pathParameters['channelId'];
            return TextChannelPage(serverId: serverId!, channelId: channelId!);
          },
        ),
      ],
    ),
  ],
);
