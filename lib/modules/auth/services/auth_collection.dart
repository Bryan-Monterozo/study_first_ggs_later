import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
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
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      print(e);
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
}
