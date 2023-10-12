import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_catalogue.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/quiz_buttons.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyQuiz extends StatelessWidget {
  static const String routeName = '/quiz';
  const StudyQuiz({super.key});

  @override
  Widget build(BuildContext context) {

    NavController navController = Get.put(NavController());

    navController.initNav(
      currentRoute: CurrentRoute.quiz,
    );

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        titlePic: titlePic(context),
        withPic: withPic(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuizButton(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizCatalogue()));
              }, 
              text: 'Quiz Catalogue')
          ],
        ),
      ),
    );
  }
}
