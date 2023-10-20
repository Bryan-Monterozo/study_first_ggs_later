import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfettiController _confettiController;
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    _confettiController.play();
    // final OptionsController optionsController = Get.put(OptionsController());
    // optionsController.update();
    return Scaffold(
      appBar: SharedAppBar(
        titlePic: titlePic(context),
        withPic: withPic(context),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  /*pi / 2,*/
                  maxBlastForce: 10, // set a lower max blast force
                  minBlastForce: 3, // set a lower min blast force
                  emissionFrequency: 0.15,
                  numberOfParticles: 5, // a lot of particles at once
                  gravity: 1,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  /*pi / 2,*/
                  maxBlastForce: 10, // set a lower max blast force
                  minBlastForce: 3, // set a lower min blast force
                  emissionFrequency: 0.2,
                  numberOfParticles: 5, // a lot of particles at once
                  gravity: 1,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  /*pi / 2,*/
                  maxBlastForce: 10, // set a lower max blast force
                  minBlastForce: 3, // set a lower min blast force
                  emissionFrequency: 0.15,
                  numberOfParticles: 5, // a lot of particles at once
                  gravity: 1,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Quiz Result',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              child: GetBuilder<OptionsController>(
                init: OptionsController(),
                builder: (controller) => Text(
                  'Your Score: ${controller.quizPoints} out of ${controller.questionTotalInt}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
                alignment: Alignment.center,
                child: GetBuilder<OptionsController>(
                  builder: (controller) => Text(
                    'Total Remaining: ${controller.secToString(controller.timeLeftInt)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                )),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('questionTotalInt');
                  Get.delete<OptionsController>();
                  Get.back();
                },
                child: const Text('Back to Quiz'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
