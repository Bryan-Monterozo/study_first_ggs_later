// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/note_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_notes_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerEditNote extends StatefulWidget {
  final noteId;
  final NoteModel noteModel;
  static const String routeName = '/reviewer/mynotes/note/edit';

  const ReviewerEditNote({
    Key? key,
    required this.noteId,
    required this.noteModel,
  }) : super(key: key);

  @override
  State<ReviewerEditNote> createState() => _ReviewerEditNoteState();
}

class _ReviewerEditNoteState extends State<ReviewerEditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    super.initState();

    NoteModel noteModel = widget.noteModel;

    title = TextEditingController(text: noteModel.title);
    content = TextEditingController(text: noteModel.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: '',
        actions: [
          TextButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            icon: const Icon(Icons.save),
            color: const Color(0xff1c1c1c),
            onPressed: () {
              ReviewerNotesDB().editNoteDB(
                title: title.text,
                content: content.text,
                noteId: widget.noteId,
              );
              Get.close(2);
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
              maxLength: 60,
              controller: title,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterStyle: TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: "",
                  hintText: 'Title'),
            ),
            Expanded(
              child: TextField(
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
                controller: content,
                maxLines: null,
                expands: true,
                decoration:
                    const InputDecoration(hintText: 'Write Something...'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
