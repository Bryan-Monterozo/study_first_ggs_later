import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  // final QuizModel? quizModel;
  const SettingsPage({
    Key? key,
    // this.quizModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
