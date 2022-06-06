import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;
  final Color color;
  const IconWithText({Key? key, required this.iconData, required this.text, required this.onPressed, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(color),
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.hovered)) return Colors.green.withOpacity(0.04);
            if (states.contains(MaterialState.focused) || (states.contains(MaterialState.pressed))) return Colors.green.withOpacity(0.12);
            return null;
          })),
      icon: Icon(
        iconData,
        color: color,
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
