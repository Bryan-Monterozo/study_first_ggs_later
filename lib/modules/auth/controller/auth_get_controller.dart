// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:study_first_ggs_later/modules/auth/models/user_model.dart';
import 'package:study_first_ggs_later/modules/auth/services/auth_collection.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'package:study_first_ggs_later/modules/shared/controller/init_assets.dart';
import 'package:study_first_ggs_later/modules/shared/controller/loading_controller.dart';

class AuthController extends GetxController {
  // Keys
  final authFormField = GlobalKey<FormState>();

  // Methods
  UserAuth userAuth = UserAuth();

  // Variables
  bool isLoading = false;
  bool togglePassword = true;

  // Text Editing Controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String authUsername = '';
  String authEmail = '';
  String authPassword = '';

  @override
  void onInit() async {
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
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
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
    // isLoading = true;
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
    Get.find<LoadingController>().isLoading.value = true;
    update(['loading']);
    await userAuth
        .login(email: 'admin@gmail.com', password: 'adminpass')
        .then((value) async {
      if (value != null) {
        isLoading = false;
        update(['loading']);
        Get.off(const StudyHome());
      } else {
        Get.find<LoadingController>().isLoading.value = false;
        // update(['loading']);
        Get.snackbar('Login', 'Something went wrong');
      }
    });
  }

  void userLogin() async {
    isLoading = true;
    update(['loading']);
    await userAuth
        .login(email: authEmail, password: authPassword)
        .then((value) async {
      if (value != null) {
        isLoading = false;
        update(['loading']);
        Get.off(const StudyHome());
      } else {
        isLoading = false;
        update(['loading']);
        Get.snackbar('Login', 'Something went wrong');
      }
    });
  }

  void addUserValidation() async {
    final isValid = authFormField.currentState!.validate();
    if (isValid) {
      userLogin();
    } else {
      Get.snackbar(
        'Login',
        'Please enter an email and password',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void togglePasswordVisibility() {
    togglePassword = !togglePassword;
    update(['password']);
  }
}
