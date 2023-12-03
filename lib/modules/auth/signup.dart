// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: (Scaffold(
            appBar: SharedAppBar(
              titlePic: titlePic(context),
              withPic: withPic(context),
            ),
            drawer: const NavDrawer(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Text('Image ng SF logo dito'),
                  Text('Start Your Journey!'),
                  Text(
                      'Register today and be part of the community.'), //header end
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('Last Name'),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('First Name'),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('E-mail'),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('Contact Number'),
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('Password'),
                          prefixIcon: Icon(Icons.fingerprint),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Sign Up'))) //sign up form ends
                    ],
                  )),
                  SizedBox(height: 30.0),
                  Column(children: [
                    Text('OR'),
                    SizedBox(height: 30.0),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.public),
                          label: Text('Sign Up with Google'),
                        )),
                    SizedBox(height: 30.0),
                    TextButton(
                        onPressed: () {},
                        child: Text.rich(TextSpan(children: const [
                          TextSpan(text: 'Already have an account?'),
                          TextSpan(text: ' Log In')
                        ])))
                  ]),
                ],
              ),
            ))));
  }
}
