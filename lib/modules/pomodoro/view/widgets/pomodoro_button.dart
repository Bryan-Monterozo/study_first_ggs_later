import 'package:flutter/material.dart';

class PomodoroButton extends StatelessWidget {
  const PomodoroButton({
    super.key,
    required this.onTap,
    required this.buttonIcon,
  });

  final Function onTap;
  final Widget buttonIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap();
      },
      icon: buttonIcon,
      color: const Color(0xFF0B6BA7),
    );
  }
}
