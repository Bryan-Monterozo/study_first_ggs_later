import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note.dart';

class ReviewerNotesDB {
  final firestore = FirebaseFirestore.instance;

  void addNoteToDB({
    required title,
    required content,
  }) async {
    final timeCreated = DateTime.now().toString();
    final collection = firestore.collection('Notes').doc();

    NoteModel noteModel = NoteModel(title: title, content: content, timeCreated: timeCreated, noteId: collection.id);

    await collection.set(noteModel.toMap());
  }

  deleteNoteDB(noteId) async {
    await firestore.collection('Notes').doc(noteId).delete();
  }
}

