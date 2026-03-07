import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';

class ServerItem extends StatefulWidget {
  const ServerItem({super.key});

  @override
  State<ServerItem> createState() => _ServerItemState();
}

class _ServerItemState extends State<ServerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 8),
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Divider(indent: 8, endIndent: 8),
              ...[
                ...List.generate(
                  10,
                  (index) => Column(
                    children: [
                      ServerItem(),
                      if (index < 9) Container(height: 8),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
