import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note.dart';

class ReviewerNotesDB {
  final firestore = FirebaseFirestore.instance;

  void addNoteToDB({
    required String title,
    required String content,
  }) async {
    final collection = firestore.collection('notes').doc();

    NoteModel noteModel = NoteModel(title: title, content: content);

    await collection.set(noteModel.toMap());
  }
}
