import 'package:flutter/material.dart';

class HomeSidebar extends StatefulWidget {
  const HomeSidebar({super.key});

  @override
  State<HomeSidebar> createState() => _HomeSidebarState();
}

class _HomeSidebarState extends State<HomeSidebar> {
  @override
  Widget build(BuildContext context) {
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
                "Home",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
