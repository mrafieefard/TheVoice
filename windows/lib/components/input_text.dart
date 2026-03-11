import 'package:application/theme.config.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText({
    super.key,
    this.label,
    this.width,
    this.height = 38,
    this.hintText,
    required this.onChanged,
  });

  final Widget? label;
  final double? width;
  final double height;
  final String? hintText;
  final Function(String value) onChanged;
  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label ?? SizedBox.shrink(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(0),
          ),
          height: widget.height,
          width: widget.width,
          child: TextField(
            cursorHeight: 20,
            cursorWidth: 1,
            onChanged: widget.onChanged,
            style: TextStyle(fontSize: 16, color: Colors.white),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 16, color: Colors.white54),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
