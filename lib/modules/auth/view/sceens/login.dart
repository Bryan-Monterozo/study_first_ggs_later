import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/auth/controller/auth_get_controller.dart';
import 'package:study_first_ggs_later/modules/auth/view/sceens/signup.dart';
//import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    authController.isLoading = false;

    return SafeArea(
      child: Scaffold(
          appBar: SharedAppBar(
            titlePic: titlePic(context),
            withPic: withPic(context),
          ),
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
                          image: NetworkImage('assets/images/Rectangle1.png'),
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
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.fingerprint),
                                  labelText: 'Password',
                                  hintText: 'Password',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.remove_red_eye_sharp),
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
                              onPressed: () {
                                if (authController.authEmail == 'ad' &&
                                    authController.authPassword == 'ad') {
                                  authController.adminLogin();
                                } else {
                                  authController.userLogin();
                                  Get.snackbar('TITE', 'Wrong credentials');
                                }
                              },
                              child: const Text('Login'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.off(const SignUp());
                                },
                                child: const Text('Sign up here!'))
                          ]))
                    ])))),
    );
  }
}
