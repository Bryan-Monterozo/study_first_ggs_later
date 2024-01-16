import 'package:flutter/material.dart';

class PomodoroButton extends StatelessWidget {
  const PomodoroButton({
    super.key,
    required this.onTap,
    required this.buttonIcon,
    required this.buttonSize,
  });

  final Function onTap;
  final Widget buttonIcon;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0),
      iconSize: buttonSize,
      onPressed: () {
        onTap();
      },
      icon: buttonIcon,
      color: const Color(0xFF0B6BA7),
    );
  }
}
