class ToDoModel {
  String id;
  String todoTitle;
  bool isDone;
  String timeCreated;
  
  ToDoModel({
    required this.id,
    required this.todoTitle,
    required this.isDone,
    required this.timeCreated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todoTitle': todoTitle,
      'isDone': isDone,
      'timeCreated': timeCreated,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] as String,
      todoTitle: map['todoTitle'] as String,
      isDone: map['isDone'] as bool,
      timeCreated: map['timeCreated'] as String,
    );
  }
}
