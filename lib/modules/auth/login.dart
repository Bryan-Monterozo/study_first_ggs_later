// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _formfield = GlobalKey<Login>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordToggle = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SharedAppBar(
            titlePic: titlePic(context),
            withPic: withPic(context),
          ),
          drawer: const NavDrawer(),
          body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Image ng SF logo dito'),
                    Text('Welcome back, Partner!'),
                    Text('Continue your journey.'), //header end
                    Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  labelText: 'E-mail',
                                  hintText: 'E-mail',
                                  border: OutlineInputBorder())),
                          const SizedBox(height: 30),
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.fingerprint),
                                  labelText: 'Password',
                                  hintText: 'Password',
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.remove_red_eye_sharp),
                                  ),
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passwordToggle = !passwordToggle;
                                      });
                                    },
                                    child: Icon(passwordToggle ? Icons.visibility: Icons.visibility_off)
                                  ))),
                          const SizedBox(height: 30),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: null,
                                  child: const Text('Forgot Password?'))),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Login'),
                          ),
                          SizedBox(height: 30.0),
                          Column(children: [
                            Text('OR'),
                            SizedBox(height: 30.0),
                            SizedBox(
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.public),
                                  label: Text('Login with Google'),
                                )),
                          ]),
                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('New here?'),
                              TextButton(onPressed: (){}, child: Text('Sign Up here!')),
                            ],
                          ),
                        ]))
                  ]))),
    );
  }
}
