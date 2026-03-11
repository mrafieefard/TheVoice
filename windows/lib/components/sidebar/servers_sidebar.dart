import 'dart:convert';

import 'package:application/components/sidebar/add_server_button.dart';
import 'package:application/components/sidebar/home_button.dart';
import 'package:application/controllers.dart';
import 'package:application/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:super_context_menu/super_context_menu.dart';

class ServerItem extends StatefulWidget {
  const ServerItem({super.key, required this.server});

  final SavedServer server;

  @override
  State<ServerItem> createState() => _ServerItemState();
}

class _ServerItemState extends State<ServerItem> {
  final serversController = Get.find<ServersController>();

  @override
  Widget build(BuildContext context) {
    final isSelected =
        GoRouter.of(context).state.pathParameters["serverId"] ==
        widget.server.id;
    return GestureDetector(
      onTap: () {
        context.go(
          "/server/${Uri.encodeComponent(widget.server.id)}",
        );
      },
      child: ContextMenuWidget(
        child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: widget.server.serverIcon == null ? Colors.grey[700] : null,
            border: isSelected
                ? Border(left: BorderSide(color: Colors.white, width: 1))
                : null,
          ),
          child: Center(
            child: widget.server.serverIcon != null
                ? Image.memory(
                    base64Decode(widget.server.serverIcon as String),
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        (widget.server.name).characters.first.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  )
                : Text(
                    (widget.server.name).characters.first
                        .toUpperCase(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        menuProvider: (_) {
          return Menu(
            children: [
              MenuAction(
                title: 'Delete',
                attributes: MenuActionAttributes(destructive: true),
                callback: () {
                  if (GoRouter.of(
                        context,
                      ).state.pathParameters["serverId"] ==
                      widget.server.id) {
                    context.go("/home");
                  }
                  serversController.removeServer(widget.server.id);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class ServersSidebar extends StatefulWidget {
  const ServersSidebar({super.key});

  @override
  State<ServersSidebar> createState() => _ServersSidebarState();
}

class _ServersSidebarState extends State<ServersSidebar> {
  final serversController = Get.find<ServersController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.white24, width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          alignment: Alignment.center,
          width: 38,
          child: Obx(
            () => ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: [
                HomeButton(),
                SizedBox(height: 8),
                AddServerButton(),
                if (serversController.servers.isNotEmpty)
                  Divider(indent: 8, endIndent: 8),
                ...serversController.servers.map(
                  (server) => Column(
                    children: [
                      ServerItem(server: server),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
