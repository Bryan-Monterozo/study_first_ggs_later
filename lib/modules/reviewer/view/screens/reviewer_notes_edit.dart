// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/note_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_notes_collection.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerEditNote extends StatefulWidget {
  final noteId;
  final NoteModel noteModel;

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
        title: widget.noteModel.title.length > 20
            ? 'Editing ${widget.noteModel.title.substring(0, 20)}...'
            : 'Editing ${widget.noteModel.title}',
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerNotesDB().editNoteDB(
                title: title.text,
                content: content.text,
                noteId: widget.noteId,
              );
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ReviewerNotes()));
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  maxLength: 60,
                  controller: title,
                  decoration: const InputDecoration(hintText: 'Title'),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration:
                      const InputDecoration(hintText: 'Write Something...'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
