import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/todo/controller/todo_get_controller.dart';
import 'package:study_first_ggs_later/modules/todo/models/todo_model.dart';
import 'package:study_first_ggs_later/modules/todo/view/widgets/search_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    final NavController navController = Get.put(NavController());
    // final TodoController todoController = Get.find<TodoController>();
    navController.initNav(
      currentRoute: CurrentRoute.todo,
    );
    // String todoTitle = '';
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        title: "To Do",
        withPic: withPic(context),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 4),
        child: FloatingActionButton.small(
            backgroundColor: const Color(0xFF0B6BA7),
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
            onPressed: () {
              todoController.addTodoValidation();
              todoController.titleController.clear();
              todoController.update(['todoList']);
            }),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 70),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: GetBuilder<TodoController>(
                init: TodoController(),
                id: 'todoList',
                builder: (controller) => SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: controller.ref,
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              int number = 0;
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    number++;
                                    debugPrint('reloaded times: $number');
                                    final todoDataMap =
                                        snapshot.data!.docs[index];
                                    ToDoModel toDoModel = ToDoModel.fromMap(
                                        todoDataMap.data()
                                            as Map<String, dynamic>);
                                    return TodoItem(
                                      toDoModel: toDoModel,
                                    );
                                  });
                            }),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text('Done Tasks',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffcecece),
                                )),
                          ),
                        ),
                      ),
                      Flexible(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: controller.isDoneRef,
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final todoDataMap =
                                          snapshot.data!.docs[index];
                                      ToDoModel toDoModel = ToDoModel.fromMap(
                                          todoDataMap.data()
                                              as Map<String, dynamic>);
                                      return TodoItem(
                                        toDoModel: toDoModel,
                                      );
                                    });
                              })),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: searchBox(),
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
                          bottom: 15,
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
                        )),
                  ),
                ),

                // Container(
                //   margin: const EdgeInsets.only(
                //     bottom: 20,
                //     right: 20,
                //   ),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       todoController.addTodoValidation();
                //       // todoController.titleController.clear();
                //       // todoController.update(['todoList']);
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.blue,
                //       minimumSize: const Size(60, 60),
                //       elevation: 10,
                //     ),
                //     child: const Text(
                //       '+',
                //       style: TextStyle(fontSize: 40),
                //     ),
                //   ),
                // )
              ])),
        ],
      ),
    );
  }
}

// Widget searchBox() {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: const TextField(
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.all(0),
//         prefixIcon: Icon(
//           Icons.search,
//           color: Colors.black,
//           size: 15,
//         ),
//         prefixIconConstraints: BoxConstraints(
//           maxHeight: 20,
//           minWidth: 25,
//         ),
//         border: InputBorder.none,
//         hintText: 'Search',
//         hintStyle: TextStyle(color: Colors.grey),
//       ),
//     ),
//   );
// }
