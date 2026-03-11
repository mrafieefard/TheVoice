import 'package:application/components/titlebar.dart';
import 'package:application/controllers.dart';
import 'package:application/pages/main_page.dart';
import 'package:application/pages/test_page.dart';
import 'package:application/router.dart';
import 'package:application/theme.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await GetStorage.init();

  Get.put(ServersController());
  Get.put(VoiceController());

  const windowOptions = WindowOptions(
    size: Size(1366, 768),
    minimumSize: Size(800, 600),
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    // await windowManager.setAsFrameless();
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  @override
  Future<void> onWindowClose() async {
    // Perform cleanup of all application services
    await _cleanupServices();

    // Force close the application
    await windowManager.destroy();
    exit(0);
  }

  Future<void> _cleanupServices() async {
    try {
      // Let any active pages cleanup their resources
      // This gives time for VoiceClient, SoLoud, AudioRecorder to dispose
      await Future.delayed(const Duration(milliseconds: 100));

      // Force cleanup of system services
      SystemNavigator.pop();
    } catch (e) {
      print('Error during cleanup: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
      ),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
      builder: (context, child) {
        return VirtualWindowFrame(
          child: Column(
            children: [
              TitleBar(brightness: context.theme.brightness),
              Expanded(child: child!),
            ],
          ),
        );
      },
    );
  }
}
