
class NoteModel {
  final String title;
  final String content;
  NoteModel({
    required this.title, 
    required this.content});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }
}
