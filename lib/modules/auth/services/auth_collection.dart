import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class UserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  login({required email, required password}) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      final currentUser = FirebaseAuth.instance.currentUser;
      print('UID: ${currentUser!.uid}');
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        userNotFound();
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        wrongCredentials();
        return null;
      } else if (e.code == 'invalid-email') {
        print('The email address is badly formatted.');
        wrongCredentials();
        return null;
      } else{
        print('Something went wrong.');
      }
    }
  }

  signUp({required email, required password, required userName}) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      await addUserToDB(
        userName: userName,
        email: email,
        password: password,
        timeCreated: DateTime.now().toString(),
        userId: user!.uid,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        weakPassword();
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        usedEmail();
        return null;
      } else if (e.code == 'invalid-email') {
        print('The email address is badly formatted.');
        invalidEmailFormat();
        return null;
      }
    } catch (e) {
      print('Something went wrong');
      signUpLastException();
      return null;
    }
  }

  signOut() async {
    await _auth.signOut();
  }

  addUserToDB({
    required userName,
    required email,
    required password,
    required timeCreated,
    required userId,
  }) async {
    final collection =
        FirebaseFirestore.instance.collection('Users').doc(userId);
    await collection.set({
      'userName': userName,
      'email': email,
      'password': password,
      'timeCreated': timeCreated,
      'userId': userId,
    });
  }


//snackbar exceptions

  void wrongCredentials(){
    Get.snackbar(
        'Login',
        'Invalid Credentials',
        snackPosition: SnackPosition.BOTTOM,
      );
  }

   void userNotFound(){
    Get.snackbar(
        'Login',
        'User not found',
        snackPosition: SnackPosition.BOTTOM,
      );
  }

  void weakPassword(){
    Get.snackbar(
        'Sign Up',
        'Weak Password',
        snackPosition: SnackPosition.BOTTOM,
      );
  }

  void usedEmail(){
    Get.snackbar(
        'Sign Up',
        'Email address is already in use',
        snackPosition: SnackPosition.BOTTOM,
      );
  }

   void invalidEmailFormat(){
    Get.snackbar(
        'Sign Up',
        'Invalid email address',
        snackPosition: SnackPosition.BOTTOM,
      );
  }

  void signUpLastException(){
    Get.snackbar(
        'Sign Up',
        'Something went wrong. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
  }


}
