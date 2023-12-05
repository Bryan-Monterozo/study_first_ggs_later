// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/todo/controller/todo_get_controller.dart';

import 'package:study_first_ggs_later/modules/todo/models/todo_model.dart';
import 'package:study_first_ggs_later/modules/todo/services/todo_collection.dart';
import 'package:study_first_ggs_later/modules/todo/view/widgets/todo_dialog.dart';

class TodoItem extends StatelessWidget {
  // final ToDo todo;
  // final onToDoChanged;
  // final onDeleteItem;
  final ToDoModel toDoModel;
  final ToDoDB toDoDB = ToDoDB();
  TodoItem({
    Key? key,
    required this.toDoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        child: ListTile(
          hoverColor: Colors.blue.shade50,
          onTap: () {
            if (toDoModel.isDone) {
              toDoModel.isDone = false;
              toDoDB.isDoneToDo(
                id: toDoModel.id,
                isDone: toDoModel.isDone,
              );
            } else {
              toDoModel.isDone = true;
              toDoDB.isDoneToDo(
                id: toDoModel.id,
                isDone: toDoModel.isDone,
              );
            }
            todoController.update(['todoList']);
          },
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
            toDoModel.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          title: Text(
            toDoModel.todoTitle,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.black,
              decoration: toDoModel.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Color(0xFF0B6BA7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                onTap: () {
                  Get.dialog(ToDoDialogWidget(toDoModel: toDoModel));
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
              GestureDetector(
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                onTap: () {
                  toDoDB.deleteToDo(
                    id: toDoModel.id,
                  );
                  todoController.update(['todoList']);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
