import 'package:flutter/material.dart';

class PomodoroButton extends StatelessWidget {
  const PomodoroButton({super.key, required this.onTap, required this.text});

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
  return ButtonTheme(
    minWidth: 200.0,
    child: Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0B6BA7),
      ),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent), 
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    ),
  );
}
}
