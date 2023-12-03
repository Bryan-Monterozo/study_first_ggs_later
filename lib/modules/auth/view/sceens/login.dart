// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/auth/controller/auth_get_controller.dart';
import 'package:study_first_ggs_later/modules/auth/view/sceens/signup.dart';
//import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
//import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordToggle = true;

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    authController.isLoading = false;

    return SafeArea(
      child: Scaffold(
          body: authController.isLoading
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
                          key: _formfield,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      labelText: 'E-mail',
                                      hintText: 'E-mail',
                                      border: OutlineInputBorder()),
                                  controller: authController.emailController,
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.fingerprint),
                                      labelText: 'Password',
                                      hintText: 'Password',
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.remove_red_eye_sharp),
                                      )),
                                  controller: authController.passwordController,
                                ),
                                const SizedBox(height: 30),
                                const Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: null,
                                        child: Text('Forgot Password?'))),
                                ElevatedButton(
                                  //ADMIN AUTH
                                  onPressed: () {
                                    if (authController.authEmail == 'ad' &&
                                        authController.authPassword == 'ad') {
                                      authController.adminLogin();
                                    }
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
    );
  }
}
