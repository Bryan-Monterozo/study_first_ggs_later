import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({super.key, required this.onTap, required this.text});

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 150.0,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
