import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_my_decks.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes/reviewer_notes.dart';
// import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/reviewer_button.dart';
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewerFcMyDecks()));
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
