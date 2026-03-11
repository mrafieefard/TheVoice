import 'package:application/theme.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.text,
    this.width,
    this.height = 32,
    this.scaleOnTap = .95,
    required this.onPressed,
    this.hasLoading = false,
    this.isDisabled = false,
    this.icon,
    this.backgroundColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  final String? text;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final bool hasLoading;
  final bool isDisabled;
  final EdgeInsetsGeometry padding;
  final double scaleOnTap;
  final Function() onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  double _buttonScale = 1;
  bool _isLoading = false;

  void updateScale(double value) {
    if (widget.isDisabled || _isLoading) return;
    setState(() => _buttonScale = value);
  }

  void updateLoading(bool value) {
    if (!widget.hasLoading) return;
    setState(() => _isLoading = value);
  }

  Color get backgroundColor {
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    return widget.isDisabled || _isLoading ? primary.withAlpha(155) : primary;
  }

  TextStyle get textStyle {
    if (widget.textStyle != null) return widget.textStyle!;
    return TextStyle(
      color: widget.isDisabled || _isLoading
          ? Colors.white54
          : context.theme.colorScheme.onPrimary,
      fontSize: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) => updateScale(widget.scaleOnTap),
      onPanCancel: () => updateScale(1),
      onPanEnd: (details) => updateScale(1),
      onTap: () async {
        if (widget.isDisabled || _isLoading) return;
        updateLoading(true);
        try {
          await widget.onPressed();
        } catch (e) {
          throw e;
        } finally {
          updateLoading(false);
        }
      },
      child: AnimatedScale(
        scale: _buttonScale,
        duration: Duration(milliseconds: 100),
        child: IntrinsicWidth(
          child: AnimatedContainer(
            padding: widget.padding,
            width: widget.width,
            duration: Duration(milliseconds: 100),
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.isDisabled || _isLoading
                  ? backgroundColor.withAlpha(155)
                  : backgroundColor,
              borderRadius: BorderRadius.circular(0),
            ),

            child: Row(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null && !_isLoading) widget.icon!,
                if (_isLoading)
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: textStyle.color,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                if (widget.text != null) Text(widget.text!, style: textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
