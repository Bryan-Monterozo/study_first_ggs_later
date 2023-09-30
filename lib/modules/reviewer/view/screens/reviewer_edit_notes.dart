import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerAddNote extends StatelessWidget {
  const ReviewerAddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: "Edit Note",
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.black,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          ),
        ],
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