import 'package:flutter/material.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({super.key, required this.serverId});

  final String serverId;

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Server page for ${widget.serverId}"),
      ),
    );
  }
}
