import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyHome extends StatefulWidget {
  const StudyHome({super.key});

  @override
  State<StudyHome> createState() => _HomeState();
}

class _HomeState extends State<StudyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study First'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
      drawer: const NavDrawer(),
    );
  }
}
