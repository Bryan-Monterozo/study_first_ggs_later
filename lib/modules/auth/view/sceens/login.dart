// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/auth/controller/auth_get_controller.dart';
import 'package:study_first_ggs_later/modules/auth/view/sceens/signup.dart';
//import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
//import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  // bool passwordToggle = true;

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    authController.isLoading = false;

    return SafeArea(
      child: GetBuilder<AuthController>(
        id: 'loading',
        init: authController,
        builder: (controller) => Scaffold(
            body: controller.isLoading
                ? Container(
                    child: const Center(
                    child: CircularProgressIndicator(),
                  ))
                : Center(
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                        const Image(
                            image: AssetImage('assets/images/Rectangle1.png'),
                            width: 500.0,
                            height: 300.0),
                        const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text('Welcome back!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                        Form(
                            key: authController.authFormField,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          labelText: 'E-mail',
                                          hintText: 'E-mail',
                                          border: OutlineInputBorder()),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: authController.emailController,
                                      validator: (emailLogIn) {
                                        if (emailLogIn == null ||
                                            emailLogIn.isEmpty) {
                                          return "Enter email";
                                        }
                                        return null;
                                      }),
                                  const SizedBox(height: 30),
                                  SizedBox(
                                      child: GetBuilder<AuthController>(
                                        id: 'password',
                                    builder: (controller) => TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.fingerprint),
                                          labelText: 'Password',
                                          hintText: 'Password',
                                          border: OutlineInputBorder(),
                                          suffix: InkWell(
                                            onTap: () {
                                              controller.togglePasswordVisibility();
                                            },
                                            child: Icon(controller.togglePassword
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                          )),
                                      validator: (passwordLogIn) {
                                        if (passwordLogIn == null ||
                                            passwordLogIn.isEmpty) {
                                          return "Enter password";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      controller: controller.passwordController,
                                      obscureText: controller.togglePassword,
                                    ),
                                  )),
                                  const SizedBox(height: 30),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text('Forgot Password?'))),
                                  ElevatedButton(
                                    //ADMIN AUTH
                                    onPressed: () {
                                      if (authController.authEmail == 'ad' &&
                                          authController.authPassword == 'ad') {
                                        authController.adminLogin();
                                      }
                                      //USER AUTH
                                      else {
                                        authController.addUserValidation();
                                      }
      
                                      // formfield.currentState!.validate();
                                    },
                                    child: const Text('Login'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('New here?'),
                                      TextButton(
                                        onPressed: () {
                                          Get.off(const SignUp());
                                        },
                                        child: Text(
                                          'Sign Up!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]))
                      ])))),
      ),
    );
  }
}
