// ignore_for_file: camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_model.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro_add.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/widgets/pomodoro_tiles.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/widgets/loading_screen.dart';

class pomodoroViewPage extends StatelessWidget {
  
  static const String routeName = '/pomodoro/pomodoro_view';
  const pomodoroViewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseFirestore.instance.collection('Users').doc(uid).collection('Pomodoro');
    return Scaffold(
      appBar: SharedAppBar(
          leading: leadingBack(context),
          title: 'Timers',
          withPic: withPic(context),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: const Color(0xFF0B6BA7),
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
            onPressed: () {
              Get.to(const pomodoroAddPage());
            }),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                    stream: ref.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: LoadingAnimationTransparent());
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final quizDataMap = snapshot.data!.docs[index];
                            PomodoroModel pomodoroModel = PomodoroModel.fromMap(
                                quizDataMap.data() as Map<String, dynamic>);
                            return PomodoroTileWidget(
                                pomodoroModel: pomodoroModel,
                                colorNotes:
                                    NoteColors().noteColorsList[index % 15]);
                          });
                    },
                  ),
                  ),
                ],
              )),
        )
    );
  }
}