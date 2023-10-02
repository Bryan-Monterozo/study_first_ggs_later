
class NoteModel {
  final String title;
  final String content;
  final String timeCreated;
  NoteModel({
    required this.title, 
    required this.content,
    required this.timeCreated,});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'timeCreated': timeCreated,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      content: map['content'] as String,
      timeCreated: map['timeCreated'],
    );
  }
}
