import 'package:flutter/material.dart';

class TextChannelPage extends StatefulWidget {
  const TextChannelPage({super.key, required this.channelId, required this.serverId});

  final String channelId;
  final String serverId;
  @override
  State<TextChannelPage> createState() => _TextChannelPageState();
}

class _TextChannelPageState extends State<TextChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Text Channel ${widget.channelId} in Server ${widget.serverId}")),
    );
  }
}
