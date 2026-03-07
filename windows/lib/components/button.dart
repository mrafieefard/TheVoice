import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.text,
    this.width,
    required this.height,
    required this.onPressed,
    this.hasLoading = false,
    this.isDisabled = false,
    this.icon,
    this.backgroundColor = Colors.white,
    this.textStyle = const TextStyle(color: Colors.black),
  });

  final String? text;
  final double? width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Widget? icon;
  final bool hasLoading;
  final bool isDisabled;
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) => updateScale(0.95),
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
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: widget.width,
            duration: Duration(milliseconds: 100),
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.isDisabled || _isLoading
                  ? widget.backgroundColor.withAlpha(155)
                  : widget.backgroundColor,
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
                      color: widget.textStyle.color,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                if (widget.text != null)
                  Text(widget.text!, style: widget.textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
