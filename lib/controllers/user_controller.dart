import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  StreamSubscription? streamSubscription;
  UserModel? userModel;

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  void setUser(UserModel model) {
    userModel = model;
    listenUser();
  }

  void listenUser() {
    streamSubscription = firebaseFirestore
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      userModel = UserModel.fromJson(event.data()!);
      update();
    });
  }
}
