import 'package:application/components/button.dart';
import 'package:application/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class VoiceSidebar extends StatefulWidget {
  const VoiceSidebar({super.key});

  @override
  State<VoiceSidebar> createState() => _VoiceSidebarState();
}

class _VoiceSidebarState extends State<VoiceSidebar> {
  final voiceController = Get.find<VoiceController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (voiceController.isConnected.value)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 54,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white24, width: 1),
                  right: BorderSide(color: Colors.white24, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(color: Colors.white24),
                    child: Icon(
                      LucideIcons.signal,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Connected",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Button(
                    padding: EdgeInsetsGeometry.zero,
                    onPressed: () {
                      voiceController.disconnect();
                    },
                    icon: Icon(
                      LucideIcons.phoneOff,
                      size: 16,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          Container(
            height: 54,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white24, width: 1),
                right: BorderSide(color: Colors.white24, width: 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(height: 32, width: 32, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "i8u",
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Obx(
                    () => Button(
                      icon: Icon(
                        voiceController.isMuted.value
                            ? LucideIcons.micOff
                            : LucideIcons.mic,
                        color: voiceController.isMuted.value
                            ? Colors.white
                            : Colors.black,
                        size: 16,
                      ),
                      height: 32,
                      width: 32,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        voiceController.toggleMute();
                      },
                      backgroundColor: voiceController.isMuted.value
                          ? Colors.redAccent
                          : Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Obx(
                    () => Button(
                      icon: Icon(
                        voiceController.isDeafened.value
                            ? LucideIcons.headphoneOff
                            : LucideIcons.headphones,
                        color: voiceController.isDeafened.value
                            ? Colors.white
                            : Colors.black,
                        size: 16,
                      ),
                      height: 32,
                      width: 32,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        voiceController.toggleDeafen();
                      },
                      backgroundColor: voiceController.isDeafened.value
                          ? Colors.redAccent
                          : Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Button(
                    icon: Icon(
                      LucideIcons.settings,
                      color: Colors.black,
                      size: 16,
                    ),
                    height: 32,
                    width: 32,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
