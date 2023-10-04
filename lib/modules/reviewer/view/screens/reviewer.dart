import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc_my_decks.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes.dart';
// import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/reviewer_button.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyReviewer extends StatelessWidget {
  const StudyReviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: SharedAppBar(
          titlePic: titlePic(context),
          withPic: withPic(context),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            ReviewerButton(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewerFcMyDecks()));
              },
              text: "Flash Cards",
            ),
            ReviewerButton(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewerNotes()));
              },
              text: "Notes",
            ),
          ]),
        )),
      );
  }
}

// _showFlashCard() {
  
// }
