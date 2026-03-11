import 'package:application/components/sidebar/channel_item.dart';
import 'package:application/utils.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:the_voice_client/the_voice_client.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem({
    super.key,
    this.channels = const [],
    required this.name,
    required this.server,
  });

  String name;
  SavedServer server;
  List<ChannelModel> channels;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              _isOpen = !_isOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 32,
            alignment: Alignment.centerLeft,
            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.name, style: TextStyle(fontSize: 14)),
                AnimatedRotation(
                  turns: _isOpen ? 0.25 : 0,
                  duration: Duration(milliseconds: 50),
                  child: Icon(
                    LucideIcons.chevronRight,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isOpen)
          Column(
            children: widget.channels
                .map((e) => ChannelItem(channel: e, server: widget.server))
                .toList(),
          ),
      ],
    );
  }
}
