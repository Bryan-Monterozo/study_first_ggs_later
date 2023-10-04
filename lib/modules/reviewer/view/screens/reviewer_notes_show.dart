// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_notes_collection.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes_edit.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
// import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class ReviewerShowNote extends StatelessWidget {
  final NoteModel? noteModel;

  const ReviewerShowNote({
    Key? key,
    this.noteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime stringToDate = DateTime.parse(noteModel!.timeCreated);
    final String dateCreated = DateFormat('MMM dd, yyyy').format(stringToDate);

    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: noteModel!.title.length > 20
            ? '${noteModel!.title.substring(0, 20)}...'
            : noteModel!.title,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewerEditNote(
                            noteId: noteModel!.noteId,
                            noteModel: noteModel!,
                          )));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              ReviewerNotesDB().deleteNoteDB(noteModel!.noteId);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteModel!.title,
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  Text(
                    'Date Modified: $dateCreated',
                  )
                ],
              ),
              const SizedBox(height: 9),
              Text(
                noteModel!.content,
              )
            ],
          ),
        )),
      ),
    );
  }
}
