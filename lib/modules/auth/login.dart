// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  labelText: 'E-mail',
                                  hintText: 'E-mail',
                                  border: OutlineInputBorder())),
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
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                            onPressed: (){}, 
                            icon: Icon(Icons.public),
                            label: Text('Login with Google'),)
                          ),
                          SizedBox(height: 30.0),
                          TextButton(
                            onPressed: () {},
                            child: const Text('No account yet? Sign up here!') 
                              )
                  ])
            )]))
                  ),
            );
  }
}
