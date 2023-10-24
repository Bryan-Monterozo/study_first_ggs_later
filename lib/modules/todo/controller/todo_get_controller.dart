import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/todo/services/todo_collection.dart';

class TodoController extends GetxController {
  final todoFormKey = GlobalKey<FormState>();
  final todoEditFormKey = GlobalKey<FormState>();
  ToDoDB toDoDB = ToDoDB();
  TextEditingController titleController = TextEditingController();
  TextEditingController editTitleController = TextEditingController();
  String todoTitle = '';
  String editTodoTitle = '';

  @override
  void onInit() async {
    titleController = TextEditingController(text: todoTitle);
    editTitleController = TextEditingController(text: editTodoTitle);
    titleController.addListener(() {
      todoTitle = titleController.text;
    });
    editTitleController.addListener(() {
      editTodoTitle = editTitleController.text;
    });
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    editTitleController.dispose();
    super.onClose();
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

  void editTodoValidation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.get('todoId');
    final isValid = todoEditFormKey.currentState!.validate();
    if (isValid) {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final quizId = prefs.getString('quizId');
      toDoDB.editToDo(
        id: id,
        todoTitle: editTodoTitle,
      );
      editTitleController.clear();
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
