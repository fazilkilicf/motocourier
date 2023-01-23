import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motocourier/models/user_model.dart';
import 'package:motocourier/services/error_handler.dart';

class FirestoreServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // SignUp Firestore
  Future signUp({required UserModel userModel}) async {
    try {
      Map<String, dynamic> data = UserModel.toJson(userModel);
      await firebaseFirestore.collection("Users").doc(userModel.uid).set(data);
    } catch (e) {
      dev.log(e.toString());
      ErrorHandler().firestoreUserErrorHandler(e.toString());
    }
  }

  // Get User Info from Firestore
  Future<Map<String, dynamic>> getUserInfo(String userId) async {
    var response =
        await firebaseFirestore.collection("Users").doc(userId).get();
    // if there is no such user data
    if (!response.exists) {
      return {"hasdata": false};
    } else {
      var data = response.data();
      UserModel userModel = UserModel.fromJson(data!);
      return {"hasdata": true, "data": userModel};
    }
  }
}
