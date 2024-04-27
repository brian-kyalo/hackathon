import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.green.shade500,
      child: Text(text),
    );
  }
}
