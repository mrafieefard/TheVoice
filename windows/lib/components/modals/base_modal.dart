import 'package:application/components/button.dart';
import 'package:application/theme.config.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BaseModal extends StatelessWidget {
  const BaseModal({
    super.key,
    required this.child,
    this.width = 400,
    this.height,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });
  final Widget child;
  final double width;
  final double? height;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.15)),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(0),
      ),
      child: AnimatedSize(
        duration: duration,
        curve: Curves.fastOutSlowIn,
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Material(child: child, color: Colors.transparent),
              Positioned(
                top: 4,
                right: 4,
                child: Button(
                  height: 24,
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  icon: Icon(LucideIcons.x, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<T?> openModal<T>(BuildContext context, WidgetBuilder builder) async {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 250),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 1.05;
      const end = 1.0;
      const curve = Curves.easeInOut;

      var scaleAnimation = Tween(
        begin: begin,
        end: end,
      ).animate(CurvedAnimation(parent: animation, curve: curve));

      var fadeAnimation = Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: animation, curve: curve));

      return FadeTransition(
        opacity: fadeAnimation,
        child: ScaleTransition(scale: scaleAnimation, child: child),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(child: builder(context));
    },
  );
}
