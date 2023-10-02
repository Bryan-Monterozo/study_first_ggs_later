// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note.dart';

class NoteTileWidget extends StatelessWidget {
  final NoteModel noteModel;

  const NoteTileWidget({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime date = DateTime.fromMillisecondsSinceEpoch(noteModel.timeCreated.millisecondsSinceEpoch);

    final DateTime stringToDate = DateTime.parse(noteModel.timeCreated);
    final String dateCreated = DateFormat('MMM dd, yyyy').format(stringToDate);

    return Container(
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        child: Column(
          children: [
            Text(
              'TITLE: ${noteModel.title}',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(dateCreated),
          ],
        ));
  }
}
