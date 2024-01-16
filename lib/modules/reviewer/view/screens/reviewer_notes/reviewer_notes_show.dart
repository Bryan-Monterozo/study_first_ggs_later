// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_notes_collection.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes/reviewer_notes_edit.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
// import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class ReviewerShowNote extends StatelessWidget {
  static const String routeName = '/reviewer/reviewer_show_note';
  final NoteModel? noteModel;

  const ReviewerShowNote({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime stringToDate = DateTime.parse(noteModel!.timeCreated);
    final String dateCreated = DateFormat('MMM dd, yyyy').format(stringToDate);

    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: '',
        actions: [
          IconButton(
            onPressed: () {
              Get.to(ReviewerEditNote(
                            noteId: noteModel!.noteId,
                            noteModel: noteModel!,
                          ));
            },
            icon: const Icon(Icons.edit_rounded),
            color: const Color(0xff1c1c1c),
          ),
          IconButton(
            onPressed: () {
              ReviewerNotesDB().deleteNoteDB(noteModel!.noteId);
              Get.back();
            },
            padding: const EdgeInsets.only(right: 12),
            icon: const Icon(Icons.delete_rounded),
            color: const Color(0xff1c1c1c),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteModel!.title,
                style: const TextStyle(
                    fontSize: 30, fontFamily: 'Poppins', fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Date Modified: $dateCreated',
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xffcecece)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                noteModel!.content,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              )
            ],
          ),
        )),
      ),
    );
  }
}
