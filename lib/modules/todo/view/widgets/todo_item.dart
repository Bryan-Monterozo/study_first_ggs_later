// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/todo/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  // final ToDo todo;
  // final onToDoChanged;
  // final onDeleteItem;
  final ToDoModel toDoModel;

  const TodoItem({
    Key? key,
    required this.toDoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item');
          // onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        // leading: Icon(
        //   todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        //   color: Colors.blue,
        // ),
        title: Text(
          toDoModel.todoTitle,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            // decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              // print('Clicked Delete button');
              // onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
