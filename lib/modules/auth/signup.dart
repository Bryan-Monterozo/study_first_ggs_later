// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child:(Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children:[
              Text('Image ng SF logo dito'),
              Text('Start Your Journey!'),
              Text('Register today and be part of the community.'),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                    const SizedBox(height: 30,),
                    SizedBox(
                      width:double.infinity,
                      child:ElevatedButton(
                        onPressed: (){},
                        child: Text('Sign Up')))
                  ],
                )
              )
            ],
          
        ),
        
      ))
    ));
  }
}