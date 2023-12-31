import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/todo/models/todo_model.dart';

class ToDoDB {
  final firestore = FirebaseFirestore.instance;
  
  createToDo({
    required todoTitle,
  }) async {
    final collection = firestore.collection('Todos').doc();
    final timeCreated = DateTime.now().toString();
    ToDoModel toDoModel = ToDoModel(
      id: collection.id,
      todoTitle: todoTitle,
      isDone: false,
      timeCreated: timeCreated,
    );
    await collection.set(toDoModel.toMap());
  }

  isDoneToDo({
    required id,
    required isDone,
  }) async {
    final collection = firestore.collection('Todos').doc(id);
    await collection.update({
      'isDone': isDone,
    });
  }

  deleteToDo ({
    required id,
  }) async {
    final collection = firestore.collection('Todos').doc(id);
    await collection.delete();
  }

  editToDo ({
    required id,
    required todoTitle,
  }) async {
    final collection = firestore.collection('Todos').doc(id);
    await collection.update({
      'todoTitle': todoTitle,
    });
  }
}
