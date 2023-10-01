import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_edit_notes.dart';

class ReviewerNotes extends StatelessWidget {
  const ReviewerNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
          titlePic: titlePic(context),
          withPic: withPic(context),
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ReviewerAddNote()));
        },
      ),
      drawer: const NavDrawer(),
      body: SafeArea(
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.all(20),
              height: 150,
              color: Colors.grey,
            );
          }
        )
      )
    ); 
  }
}
