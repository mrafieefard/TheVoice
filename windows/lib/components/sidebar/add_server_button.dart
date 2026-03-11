import 'package:application/components/modals/add_new_server_modal.dart';
import 'package:application/components/modals/base_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AddServerButton extends StatefulWidget {
  const AddServerButton({super.key});

  @override
  State<AddServerButton> createState() => _AddServerButtonState();
}

class _AddServerButtonState extends State<AddServerButton> {
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return GestureDetector(
      onTapDown: (details) => setState(() => _scale = 0.95),
      onTapUp: (details) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: () {
        openModal(context, (context) => AddNewServerModal());
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: _scale,
        child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(color: colorScheme.primary),
          child: Icon(LucideIcons.plus, size: 20, color: colorScheme.onPrimary),
        ),
      ),
    );
  }
}
