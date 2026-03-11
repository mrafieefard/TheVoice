import 'package:application/controllers.dart';
import 'package:application/theme.config.dart';
import 'package:application/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:the_voice_client/the_voice_client.dart';

class ChannelItem extends StatefulWidget {
  const ChannelItem({super.key, required this.channel, required this.server});

  final ChannelModel channel;
  final SavedServer server;
  @override
  State<ChannelItem> createState() => _ChannelItemState();
}

class _ChannelItemState extends State<ChannelItem> {
  bool _isHovering = false;
  Widget channelIcon() {
    switch (widget.channel.type) {
      case ChannelType.text:
        return Icon(LucideIcons.hash, size: 14, color: textColor);
      case ChannelType.voice:
        return Icon(LucideIcons.volume2, size: 14, color: textColor);
      default:
        return Icon(LucideIcons.hash, size: 14, color: textColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final voiceController = Get.find<VoiceController>();
    final isSelected =
        GoRouter.of(context).state.pathParameters["channelId"] ==
            widget.channel.id &&
        GoRouter.of(context).state.pathParameters["serverId"] ==
            widget.server.id;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            switch (widget.channel.type) {
              case ChannelType.text:
                context.go(
                  "/server/${Uri.encodeComponent(widget.server.id)}/channel/${Uri.encodeComponent(widget.channel.id)}",
                );
                break;
              case ChannelType.voice:
                voiceController.connect(widget.server.address);
                break;
              default:
            }
          },
          child: MouseRegion(
            onEnter: (event) => setState(() => _isHovering = true),
            onExit: (event) => setState(() => _isHovering = false),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              color: _isHovering || isSelected
                  ? Colors.white12
                  : Colors.transparent,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  channelIcon(),
                  Text(widget.channel.name, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
        if (widget.channel.type == ChannelType.voice)
          Container(
            height: 32,
            color: Colors.white24,
            margin: EdgeInsets.only(left: 16),
            child: Row(children: [
              
            ],
          ),
          ),
      ],
    );
  }
}
