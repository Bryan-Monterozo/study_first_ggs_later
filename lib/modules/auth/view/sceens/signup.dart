// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/auth/controller/auth_get_controller.dart';
import 'package:study_first_ggs_later/modules/auth/view/sceens/login.dart';
import 'package:study_first_ggs_later/modules/shared/controller/loading_controller.dart';
import 'package:study_first_ggs_later/modules/shared/widgets/loading_screen.dart';
//import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
//import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
//import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    Get.delete<LoadingController>();
    final LoadingController loadingController = Get.put(LoadingController());
    authController.isLoading = false;
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              // const Text('Image ng SF logo dito'),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Start Your Journey!',
                  style: TextStyle(
                      color: Color(0xFF0B6BA7),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Register today and be part of the community.',
                  style: TextStyle(
                      color: Color(0xFF1c1c1c),
                      fontSize: 14,
                      fontFamily: 'Poppins'),
                ),
              ), //header end
              SizedBox(height: 30),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      controller: authController.usernameController,
                      validator: (usernameSignUp) {
                        if (usernameSignUp == null || usernameSignUp.isEmpty) {
                          return "Enter username";
                        }
                        return null;
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Emain or Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      controller: authController.emailController,
                      validator: (emailSignUp) {
                        if (emailSignUp == null || emailSignUp.isEmpty) {
                          return "Enter email";
                        }
                        return null;
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    controller: authController.passwordController,
                    validator: (passwordSignUp) {
                      if (passwordSignUp == null || passwordSignUp.isEmpty) {
                        return "Enter password";
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFF0B6BA7),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            minimumSize: Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            authController.createNewUser();
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ))) //sign up form ends
                ],
              )),
              const SizedBox(height: 30.0),
              Row(children: const <Widget>[
                Expanded(child: Divider()),
                Text('Or Sign Up with',
                    style: TextStyle(
                      color: Color(0xff1c1c1c),
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    )),
                Expanded(child: Divider()),
              ]),
              const SizedBox(height: 30.0),
              // SizedBox(
              //     width: double.infinity,
              //     child: OutlinedButton.icon(
              //       onPressed: () {},
              //       icon: const Icon(Icons.public),
              //       label: const Text('Sign Up with Google'),
              //     )),
              const Image(
                  image: AssetImage('assets/images/googlelogo.png'),
                  width: 50.0,
                  height: 50.0),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(const Login());
                    },
                    child: Text(
                      'Login here!',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Obx(() => loadingController.isLoading.value
          ? const LoadingAnimation()
          : Container())
    ])));
  }
}
