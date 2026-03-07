import 'package:application/components/servers_sidebar.dart';
import 'package:application/pages/test_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ServersSidebar(),
          Expanded(child: TestPage()),
        ],
      ),
    );
  }
}
