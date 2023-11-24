import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/auth/constants_login.dart';
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
            body: Center(
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
                    const Text('Study First. GGS later.',
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
                          const Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: null,
                                  child: Text('Forgot Password?'))),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Login'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Sign up here!') 
                              )
                            ))
                        ]))
                  ]),
            )));
  }
}
