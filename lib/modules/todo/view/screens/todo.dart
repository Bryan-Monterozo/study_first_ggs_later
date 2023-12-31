import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/todo/controller/todo_get_controller.dart';
import 'package:study_first_ggs_later/modules/todo/models/todo_model.dart';
import 'package:study_first_ggs_later/modules/todo/view/widgets/todo_item.dart';

class StudyToDo extends StatelessWidget {
  // static const String routeName = '/todo';
  final ToDoModel? toDoModel;
  StudyToDo({
    Key? key,
    this.toDoModel,
  }) : super(key: key);
  // @override
  // void initState() {
  //   navController.initNav(
  //     currentRoute: CurrentRoute.todo,
  //   );
  //   super.initState();
  // }

  // final todosList = ToDo.todoList();
  // final _todoController = TextEditingController();
  final ref = FirebaseFirestore.instance.collection('Todos').snapshots();

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
    final TodoController todoController = Get.put(TodoController());
    // final TodoController todoController = Get.find<TodoController>();
    navController.initNav(
      currentRoute: CurrentRoute.todo,
    );
    // String todoTitle = '';
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        titlePic: titlePic(context),
        withPic: withPic(context),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                GetBuilder<TodoController>(
                  builder: (controller) => Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: ref,
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          int number = 0;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                number++;
                                debugPrint('reloaded times: $number');
                                final todoDataMap = snapshot.data!.docs[index];
                                ToDoModel toDoModel = ToDoModel.fromMap(
                                    todoDataMap.data() as Map<String, dynamic>);
                                return TodoItem(
                                  toDoModel: toDoModel,
                                );
                              });
                        }),
                    // child: ListView(
                    //   children: [
                    //     Container(
                    //       margin: const EdgeInsets.only(
                    //         top: 50,
                    //         bottom: 20,
                    //       ),
                    //       child: const Text(
                    //         'All Todos',
                    //         style: TextStyle(
                    //           fontSize: 30,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //     for (ToDo todoo in todosList)
                    //       TodoItem(
                    //         todo: todoo,
                    //         onToDoChanged: _handleToDoChange,
                    //         onDeleteItem: _deleteTodoItem,
                    //       ),
                    //   ],
                    // ),
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                GetBuilder<TodoController>(
                  id: 'todoList',
                  builder: (controller) => Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Form(
                          key: todoController.todoFormKey,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Enter an Item' : null,
                            controller: todoController.titleController,
                            decoration: const InputDecoration(
                                hintText: 'Add a new todo item',
                                border: InputBorder.none,
                                errorStyle: TextStyle(
                                  fontSize: 0.1,
                                  color: Colors.red,
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                )),
                          ),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      todoController.addTodoValidation();
                      // todoController.titleController.clear();
                      // todoController.update(['todoList']);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ])),
        ],
      ),
    );
  }

  // void _handleToDoChange(ToDo todo) {
  //   setState(() {
  //     todo.isDone = !todo.isDone;
  //   });
  // }

  // void _deleteTodoItem(String id) {
  //   setState(() {
  //     todosList.removeWhere((item) => item.id == id);
  //   });
  // }

  // void _addTodoItem(String toDo) {
  //   setState(() {
  //     todosList.add(ToDo(
  //       id: DateTime.now().millisecondsSinceEpoch.toString(),
  //       todoText: toDo,
  //     ));
  //   });

  //   _todoController.clear();
  // }
}

Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 15,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );
}
