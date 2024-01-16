import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_notes_collection.dart';

class ReviewerAddNote extends StatefulWidget {
  const ReviewerAddNote({super.key});
  static const String routeName = '/reviewer/mynotes/note/add';

  @override
  State<ReviewerAddNote> createState() => _ReviewerAddNoteState();
}

class _ReviewerAddNoteState extends State<ReviewerAddNote> {
  // final TextEditingController title = TextEditingController();

  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: "Create a Note",
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text('Cancel', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
            onPressed: () {
              Get.to(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerNotesDB().addNoteToDB(
                title: title, 
                content: content,);
              Get.back();
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
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(hintText: 'Title'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    content = value;
                  },
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
