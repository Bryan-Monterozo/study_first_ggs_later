import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyReviewer extends StatelessWidget {
  const StudyReviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviewer'),
      ),
      body: const Center(
        child: Text('Reviewer'),
      ),
      drawer: const NavDrawer(),
    );
  }
}