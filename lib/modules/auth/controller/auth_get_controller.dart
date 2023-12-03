// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:study_first_ggs_later/modules/auth/models/user_model.dart';
import 'package:study_first_ggs_later/modules/auth/services/auth_collection.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';

class AuthController extends GetxController {
  // Methods
  UserAuth userAuth = UserAuth();

  // Variables
  bool isLoading = false;

  // Text Editing Controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String authUsername = '';
  String authEmail = '';
  String authPassword = '';

  @override
  void onInit() {
    usernameController = TextEditingController(text: authUsername);
    emailController = TextEditingController(text: authEmail);
    passwordController = TextEditingController(text: authPassword);
    usernameController.addListener(() {
      authUsername = usernameController.text;
    });
    emailController.addListener(() {
      authEmail = emailController.text;
    });
    passwordController.addListener(() {
      authPassword = passwordController.text;
    });
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.removeListener(() {
      authUsername = usernameController.text;
    });
    emailController.removeListener(() {
      authEmail = emailController.text;
    });
    passwordController.removeListener(() {
      authPassword = passwordController.text;
    });
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Make this into a Validation look into todo_get_controller.dart
  void createNewUser() async {
    // final user = FirebaseAuth.instance.currentUser;
    await userAuth
        .signUp(
            email: authEmail, password: authPassword, userName: authUsername)
        .then((value) {
      if (value != null) {
        isLoading = false;
        Get.off(const StudyHome());
      }
    });
  }
  void adminLogin() async {
    await userAuth
        .login(email: 'admin@gmail.com', password: 'adminpass')
        .then((value) async {
      if (value != null) {
        isLoading = false;
        Get.off(const StudyHome());
      } else {
        isLoading = false;
        Get.snackbar('Login', 'Something went wrong');
      }
    });
  }
}