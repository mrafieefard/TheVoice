import 'package:application/components/modals/add_new_server_modal.dart';
import 'package:application/components/modals/base_modal.dart';
import 'package:application/theme.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({super.key});

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    final isHome = GoRouter.of(context).state.path == "/home";
    final colorScheme = context.theme.colorScheme;
    return GestureDetector(
      onTapDown: (details) => setState(() => _scale = 0.95),
      onTapUp: (details) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: () {
        context.go("/home");
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: isHome ? accentColor : colorScheme.primary,
          ),
          child: Icon(
            LucideIcons.house,
            size: 20,
            color: isHome ? Colors.white : colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
