import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/todo/services/todo_collection.dart';

class TodoController extends GetxController {
  final todoFormKey = GlobalKey<FormState>();
  ToDoDB toDoDB = ToDoDB();
  TextEditingController titleController = TextEditingController();
  String todoTitle = '';

  @override
  void onInit() async {
    titleController = TextEditingController(text: todoTitle);
    titleController.addListener(() {
      todoTitle = titleController.text;
    });
    super.onInit();
  }

  void addTodoValidation() async {
    final isValid = todoFormKey.currentState!.validate();
    if (isValid) {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final quizId = prefs.getString('quizId');
      toDoDB.createToDo(
        todoTitle: todoTitle,
      );
      titleController.clear();
      update(['todoList']);
    } else {
      Get.snackbar(
        'Todo',
        'Please enter an item',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
