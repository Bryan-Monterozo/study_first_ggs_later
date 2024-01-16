// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/auth/controller/auth_get_controller.dart';
import 'package:study_first_ggs_later/modules/auth/view/sceens/login.dart';
//import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
//import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
//import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    authController.isLoading = false;

    return SafeArea(
        child: (Scaffold(
            body: authController.isLoading
                ? Container(
                    child: const Center(
                    child: CircularProgressIndicator(),
                  ))
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: [
                        const Text('Image ng SF logo dito'),
                        const Text('Start Your Journey!'),
                        const Text(
                            'Register today and be part of the community.'), //header end
                        Form(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Username'),
                                hintText: 'Username',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              controller: authController.usernameController,
                              validator: (usernameSignUp){
                                if(usernameSignUp == null || usernameSignUp.isEmpty){
                                      return "Enter username";
                                    }
                                    return null;
                              }
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('E-mail'),
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              controller: authController.emailController,
                              validator: (emailSignUp){
                                if(emailSignUp == null || emailSignUp.isEmpty){
                                      return "Enter email";
                                    }
                                    return null;
                              }
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Password'),
                                prefixIcon: Icon(Icons.fingerprint),
                                border: OutlineInputBorder(),
                              ),
                              controller: authController.passwordController,
                              validator: (passwordSignUp){
                                if(passwordSignUp == null || passwordSignUp.isEmpty){
                                      return "Enter password";
                                    }
                                    return null;
                              },
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      authController.createNewUser();
                                    },
                                    child: const Text(
                                        'Sign Up'))) //sign up form ends
                          ],
                        )),
                        const SizedBox(height: 30.0),
                        Column(children: [
                          const Text('OR'),
                          const SizedBox(height: 30.0),
                          SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.public),
                                label: const Text('Sign Up with Google'),
                              )),
                          Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already have an account?'),
                                    TextButton(
                                      onPressed: () {
                                        Get.off(const Login());
                                      },
                                      child: Text(
                                        'Login here!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                        ]),
                      ],
                    ),
                  ))));
  }
}
