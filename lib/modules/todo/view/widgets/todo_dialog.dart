// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/todo/controller/todo_get_controller.dart';
import 'package:study_first_ggs_later/modules/todo/models/todo_model.dart';
import 'package:study_first_ggs_later/modules/todo/services/todo_collection.dart';

class ToDoDialogWidget extends StatelessWidget {
  final ToDoModel toDoModel;
  final ToDoDB toDoDB = ToDoDB();

  ToDoDialogWidget({
    Key? key,
    required this.toDoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    String id = toDoModel.id;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Material(
          color: Colors.transparent,
          child: Container(
            // padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: todoController.todoEditFormKey,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an Item' : null,
                      controller: todoController.editTitleController,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Color(0xff1c1c1c)),
                      decoration: const InputDecoration(
                          hintText: 'Edit a new todo item',
                          border: InputBorder.none,
                          errorStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 0.1,
                            color: Colors.red,
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF0B6BA7)),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('todoId', id);
                          todoController.editTodoValidation();
                          Get.back();
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.red),
                        onPressed: () {
                          Get.back();
                          todoController.editTitleController.clear();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
