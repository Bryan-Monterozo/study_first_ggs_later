import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviwer_flash_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/reviewer_button.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyReviewer extends StatelessWidget {
  const StudyReviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: const SharedAppBar(),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            ReviewerButton(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FlashCard()));
              },
              text: "test",
            )
          ]),
        )),
      );
  }
}

// _showFlashCard() {
  
// }
