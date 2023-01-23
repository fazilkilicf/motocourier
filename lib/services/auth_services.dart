import 'dart:developer' as dev;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'error_handler.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // SignUp
  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      /* await userCredential.user?.sendEmailVerification(); */
    } on FirebaseAuthException catch (e) {
      await EasyLoading.dismiss();
      dev.log(e.toString());
      // Todo
      ErrorHandler().authErrorHandler(e.code);
    }
    return userCredential!;
  }

  // SignIn
  Future<UserCredential?> signInWithEmail(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await EasyLoading.dismiss();
      dev.log(e.toString());
      ErrorHandler().authErrorHandler(e.code);
    }
    return userCredential;
  }

  // SignOut
  Future signOut() async {
    await firebaseAuth.signOut();
  }
}
