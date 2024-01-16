import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        title: "",
        actions: [
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Get.to(context);
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            color: const Color(0xff1c1c1c),
            icon: const Icon(Icons.save_rounded),
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
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
              maxLength: 60,
              onChanged: (value) {
                title = value;
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterStyle: TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: "",
                  hintStyle: TextStyle(
                    color: Color(0xffcecece),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  hintText: 'Title'),
            ),
            Text((DateFormat('d MMMM h:mm a').format(DateTime.now())),
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.black54)),
            Expanded(
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
                onChanged: (value) {
                  content = value;
                },
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xffcecece),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                    hintText: 'Write Something...'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
