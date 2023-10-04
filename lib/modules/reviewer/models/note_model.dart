class NoteModel {
  final String title;
  final String content;
  final String timeCreated;
  final String noteId;

  NoteModel({
    required this.title,
    required this.content,
    required this.timeCreated,
    required this.noteId,

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'timeCreated': timeCreated,
      'noteId': noteId,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      content: map['content'] as String,
      timeCreated: map['timeCreated'],
      noteId: map['noteId'] as String,

    );
  }
}
