import 'package:application/components/sidebar/channels_sidebar.dart';
import 'package:application/components/sidebar/home_sidebar.dart';
import 'package:application/components/sidebar/servers_sidebar.dart';
import 'package:application/components/sidebar/voice_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with TickerProviderStateMixin {
  double sidebarWidth = 300;
  double? dragStartX;
  double? dragStartWidth;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    final isHome = GoRouter.of(context).state.path == "/home";
    return Stack(
      children: [
        AnimatedContainer(
          duration: isDragging
              ? Duration.zero
              : const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          width: sidebarWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ServersSidebar(),
                    if (isHome) HomeSidebar() else ChannelsSidebar(),
                  ],
                ),
              ),
              VoiceSidebar(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          width: 8,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragStart: (details) {
              setState(() {
                isDragging = true;
              });
              dragStartX = details.globalPosition.dx;
              dragStartWidth = sidebarWidth;
            },
            onHorizontalDragUpdate: (details) {
              if (dragStartX == null || dragStartWidth == null) return;

              double deltaX = details.globalPosition.dx - dragStartX!;
              double newWidth = dragStartWidth! + deltaX;

              if (newWidth >= 200 && newWidth <= 400) {
                setState(() {
                  sidebarWidth = newWidth;
                });
              }
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                isDragging = false;
              });
              dragStartX = null;
              dragStartWidth = null;
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Container(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
