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
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.all(24),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          const Image(
                              image: AssetImage('assets/images/logoFINAL.png'),
                              width: 200.0,
                              height: 200.0),
                          // const Text(
                          //   'Login',
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontFamily: 'Poppins',
                          //       fontSize: 32,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // const Text('Welcome back!',
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //     )),
                          Form(
                              key: authController.authFormField,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                            hintText: 'Emain or Phone Number',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            )),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller:
                                            authController.emailController,
                                        validator: (emailLogIn) {
                                          if (emailLogIn == null ||
                                              emailLogIn.isEmpty) {
                                            return "Enter email";
                                          }
                                          return null;
                                        }),
                                    const SizedBox(height: 20),
                                    GetBuilder<AuthController>(
                                      id: 'password',
                                      builder: (controller) => TextFormField(
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                            hintText: 'Password',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            suffix: InkWell(
                                              onTap: () {
                                                controller
                                                    .togglePasswordVisibility();
                                              },
                                              child: Icon(
                                                  controller.togglePassword
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller:
                                            controller.passwordController,
                                        obscureText: controller.togglePassword,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Color(0xFF0B6BA7),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20),
                                        minimumSize: Size(double.infinity, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (authController.authEmail == 'ad' &&
                                            authController.authPassword ==
                                                'ad') {
                                          authController.adminLogin();
                                        }
                                        //USER AUTH
                                        else {
                                          authController.addUserValidation();
                                        }
                                        // formfield.currentState!.validate();
                                      },
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Forgot Password?',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins'),
                                            ))),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'New here?',
                                          style:
                                              TextStyle(fontFamily: 'Poppins'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.off(const SignUp());
                                          },
                                          child: Text(
                                            'Sign Up!',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
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
