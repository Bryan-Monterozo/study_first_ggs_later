import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/shared/controller/loading_controller.dart';
import 'package:study_first_ggs_later/modules/todo/services/todo_collection.dart';

class TodoController extends GetxController {
  //Keys
  final todoFormKey = GlobalKey<FormState>();
  final todoEditFormKey = GlobalKey<FormState>();
  // final uid = FirebaseAuth.instance.currentUser!.uid;

  //SERVICES
  Stream<QuerySnapshot> ref = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Todos')
      .where('isDone', isEqualTo: false)
      .orderBy('todoTitle', descending: false)
      .snapshots();
  Stream<QuerySnapshot> isDoneRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Todos')
      .where('isDone', isEqualTo: true)
      .orderBy('todoTitle', descending: false)
      .snapshots();
  // CollectionReference refQuery =
  //     FirebaseFirestore.instance.collection('Todos');

  //Methods
  ToDoDB toDoDB = ToDoDB();

  //Text Editing Controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController editTitleController = TextEditingController();
  TextEditingController searchTodoController = TextEditingController();
  String todoTitle = '';
  String editTodoTitle = '';
  String searchTodo = '';

  @override
  void onInit() async {
    titleController = TextEditingController(text: todoTitle);
    editTitleController = TextEditingController(text: editTodoTitle);
    searchTodoController = TextEditingController(text: searchTodo);
    titleController.addListener(() {
      todoTitle = titleController.text;
    });
    editTitleController.addListener(() {
      editTodoTitle = editTitleController.text;
    });
    searchTodoController.addListener(() {
      onSearchChanged();
      searchTodo = searchTodoController.text;
    });
    super.onInit();
  }

  onSearchChanged() {
    debugPrint(searchTodoController.text);
  }

  @override
  void onClose() {
    titleController.removeListener(() {
      todoTitle = titleController.text;
    });
    editTitleController.removeListener(() {
      editTodoTitle = editTitleController.text;
    });
    searchTodoController.removeListener(() {
      searchTodo = searchTodoController.text;
    });
    titleController.dispose();
    editTitleController.dispose();
    searchTodoController.dispose();
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
      searchTodoController.clear();
      update(['todoList']);
    } else {
      Get.snackbar(
        'Todo',
        'Please enter an item',
        snackPosition: SnackPosition.BOTTOM,
      );
      searchTodoController.clear();
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
      searchTodoController.clear();
      update(['todoList']);
    } else {
      Get.snackbar(
        'Todo',
        'Please enter an item',
        snackPosition: SnackPosition.BOTTOM,
      );
      searchTodoController.clear();
    }
  }

  searchTodoList(String query) {
    Get.find<LoadingController>().isLoading.value = true;
    print(Get.find<LoadingController>().isLoading.value);
    if (searchTodoController.text.isEmpty) {
      ref = FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Todos')
          .where('isDone', isEqualTo: false)
          .orderBy('todoTitle', descending: false)
          .snapshots();
      isDoneRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Todos')
          .where('isDone', isEqualTo: true)
          .orderBy('todoTitle', descending: false)
          .snapshots();
    } else {
      ref = FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Todos')
          // .where('isDone', isEqualTo: false)
          .where('todoTitle', isGreaterThanOrEqualTo: query)
          .where('todoTitle', isLessThan: query + '\uf8ff')
          .where('isDone', isEqualTo: false)
          .snapshots();
      isDoneRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Todos')
          .where('todoTitle', isGreaterThanOrEqualTo: query)
          .where('todoTitle', isLessThan: query + '\uf8ff')
          .where('isDone', isEqualTo: true)
          .snapshots();
    }
    Get.find<LoadingController>().isLoading.value = false;
    print(Get.find<LoadingController>().isLoading.value);
    update(['todoList']);
  }
}
