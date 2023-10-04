import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes_show.dart';

class NoteTileWidget extends StatelessWidget {
  final NoteModel noteModel;
  final Color colorNotes;

  const NoteTileWidget({
    Key? key,
    required this.noteModel,
    required this.colorNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime date = DateTime.fromMillisecondsSinceEpoch(noteModel.timeCreated.millisecondsSinceEpoch);

    final DateTime stringToDate = DateTime.parse(noteModel.timeCreated);
    final String dateCreated = DateFormat('MMM dd, yyyy').format(stringToDate);

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewerShowNote(noteModel: noteModel,)));
        },
        child: Container(
            decoration: BoxDecoration(
                color: colorNotes,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noteModel.title,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(dateCreated),
              ],
            )),
      ),
    );
  }
}
