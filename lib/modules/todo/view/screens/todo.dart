import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyToDo extends StatelessWidget {
  const StudyToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: const Center(
        child: Text('To Do'),
      ),
      drawer: const NavDrawer(),
    );
  }
}