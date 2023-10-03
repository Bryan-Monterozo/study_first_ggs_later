import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_notes_collection.dart';

class ReviewerAddNote extends StatefulWidget {
  const ReviewerAddNote({super.key});

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
        title: "Edit Note",
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerNotesDB().addNoteToDB(
                title: title, 
                content: content,);
              Navigator.pop(context);
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

// class AddNoteAppBar extends SharedAppBar {
//   const AddNoteAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // title: const Text("Add Note"),
      
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.delete),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: const Icon(Icons.save),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }

// Widget withPic(BuildContext context) {
//   return Container(
//     width: 80,
//     height: 80,
//     clipBehavior: Clip.antiAlias,
//     decoration: const BoxDecoration(
//       shape: BoxShape.circle,
//     ),
//     child: kIsWeb
//         ? Image.network(
//             'assets/images/Ellipse1.png',
//             fit: BoxFit.cover,
//             alignment: const Alignment(0.00, -0.50),
//           )
//         : Image.asset(
//             'assets/images/Ellipse1.png',
//             fit: BoxFit.cover,
//             alignment: const Alignment(0.00, -0.50),
//           ),
//   );
// }