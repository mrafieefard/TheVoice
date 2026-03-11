import 'package:application/components/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.child});

  final Widget? child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          if (widget.child != null) Expanded(child: widget.child!),
        ],
      ),
    );
  }
}
