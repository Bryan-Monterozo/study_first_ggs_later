import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_my_decks.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes/reviewer_notes.dart';
// import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/reviewer_widget.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyReviewer extends StatelessWidget {
  final NavController navController = Get.put(NavController());
  StudyReviewer({super.key});
  
  static const String routeName = '/reviewer';

  @override
  Widget build(BuildContext context) {

    
    navController.initNav(
      currentRoute: CurrentRoute.reviewer,
    );

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        title: "Reviewer",
        withPic: withPic(context),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.all(48),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ReviewerGesture(
                    revNavigator: ReviewerFcMyDecks(),
                    revContainer: ReviewerWidget(
                      reviewerText: 'Flash Cards',
                      reviewerColor: Color(0xFF0B6BA7),
                      reviewerPic: kIsWeb
                      ? 'assets/images/flash-card.png'
                      : 'assets/images/flash-card.png',
                    ),
                  ),
                  ReviewerGesture(
                    revNavigator: ReviewerNotes(),
                    revContainer: const ReviewerWidget(
                      reviewerText: 'Notes',
                      reviewerColor: Color(0xFF57BA5E),
                      reviewerPic: kIsWeb
                      ? 'assets/images/notes.png'
                      : 'assets/images/notes.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// _showFlashCard() {

// }
