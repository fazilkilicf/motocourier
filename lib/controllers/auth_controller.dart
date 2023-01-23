import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motocourier/constants/constants.dart';
import 'package:motocourier/controllers/user_controller.dart';
import 'package:motocourier/models/user_model.dart';
import 'package:motocourier/screens/courier_main_screen/courier_main_screen.dart';
import 'package:motocourier/screens/customer_main_screen/customer_main_screen.dart';
import 'package:motocourier/screens/welcome_screen/welcome_screen.dart';
import 'package:motocourier/services/firestore_services.dart';
import 'dart:developer' as dev;
import '../services/auth_services.dart';
import '../widgets/custom_snackbar.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  StreamSubscription? authSubscription;

  AuthService authService = AuthService();
  FirestoreServices firestoreServices = FirestoreServices();

  String get uid => firebaseAuth.currentUser!.uid;

  // Sign In Widget Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  // Sign Up Widget Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  @override
  void onInit() {
    dev.log("onInit()");
    /* logOut(); */
    appStart();
    super.onInit();
  }

  Future appStart() async {
    dev.log("appStart()");
    listenAuth();
  }

  void listenAuth() {
    authSubscription = firebaseAuth.authStateChanges().listen((user) async {
      if (user == null) {
        dev.log('user==null');
        Future.delayed(const Duration(seconds: 1),
            () => Get.offAll(() => const WelcomeScreen()));
      } else {
        dev.log("has user");
        await firebaseAuth.currentUser?.reload();
        // User type control and screen navigation.
        await checkUserInfo();
      }
    });
  }

  Future checkUserInfo() async {
    Map<String, dynamic> response = await firestoreServices.getUserInfo(uid);
    bool hasData = response["hasdata"];
    if (hasData) {
      UserModel userModel = response["data"];
      UserType userType = getUserType(typeId: userModel.type);
      setUser(userModel);
      // Screen Navigation by User Type
      switch (userType) {
        case UserType.customer:
          // Navigate to Customer Main Screen
          dev.log('Navigate to Customer Main Screen');
          Get.offAll(() => const CustomerMainScreen());
          break;
        case UserType.courier:
          // Navigate to Courier Main Screen
          dev.log('Navigate to Courier Main Screen');
          Get.offAll(() => const CourierMainScreen());
          break;
        default:
          // Navigate to Welcome Screen
          dev.log('Navigate to Welcome Screen');
          logOut();
          Get.offAll(() => const WelcomeScreen());
          break;
      }
    } else {
      logOut();
      // Navigate to Welcome Screen
      dev.log('Navigate to Welcome Screen');
      Get.offAll(() => const WelcomeScreen());
    }
  }

  // Sign Up
  Future signUp({required UserType userType}) async {
    if (validateSignUpFields()) {
      // Show loading
      await EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
      // Auth Sign up
      UserCredential? userCredential;
      userCredential = await authService.signUpWithEmail(
          emailController.text, passwordController.text);
      if (userCredential != null) {
        UserModel userModel = UserModel(
            uid: userCredential.user!.uid,
            type: userType == UserType.courier ? 1 : 2,
            name: nameController.text,
            surname: surnameController.text,
            mail: emailController.text,
            location: const LatLng(39.848622, 32.832566));
        // Store to Firestore
        await firestoreServices.signUp(userModel: userModel);
        await EasyLoading.dismiss();
      }
    }
  }

  // Sign In
  Future signIn() async {
    if (validateSignInFields()) {
      await EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
      await AuthService()
          .signInWithEmail(emailController.text, passwordController.text);
      await EasyLoading.dismiss();
    }
  }

  // Log Out
  Future logOut() async {
    await EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    AuthService()
        .signOut()
        .whenComplete(() async => await EasyLoading.dismiss());
  }

  // Field Controller
  bool validateSignUpFields() {
    BuildContext context = Get.context!;
    if (nameController.text.isEmpty) {
      showFailureTypeSnackbar(
          context: context, text: 'İsim alanı boş geçilemez');
      return false;
    }
    if (surnameController.text.isEmpty) {
      showFailureTypeSnackbar(
          context: context, text: 'Soyisim alanı boş geçilemez');
      return false;
    }
    if (emailController.text.isEmpty) {
      showFailureTypeSnackbar(
          context: context, text: 'Email alanı boş geçilemez');
      return false;
    }
    if (passwordController.text.isEmpty) {
      showFailureTypeSnackbar(
          context: context, text: 'Şifre alanı boş geçilemez');
      return false;
    }
    if (passwordAgainController.text.isEmpty) {
      showFailureTypeSnackbar(
          context: context, text: 'Şifre tekrar alanı boş geçilemez');
      return false;
    }
    if (passwordAgainController.text != passwordAgainController.text) {
      showFailureTypeSnackbar(context: context, text: 'Şifreler uyuşmuyor.');
      return false;
    }
    return true;
  }

  bool validateSignInFields() {
    BuildContext context = Get.context!;
    if (emailController.text.isEmpty) {
      showFailureTypeSnackbar(
          context: context, text: 'Email alanı boş geçilemez');
      return false;
    }
    if (passwordController.text.isEmpty) {
      showFailureTypeSnackbar(
          context: context, text: 'Şifre alanı boş geçilemez');
      return false;
    }
    return true;
  }

  UserType getUserType({required int typeId}) {
    switch (typeId) {
      case 1:
        return UserType.customer;
      case 2:
        return UserType.courier;
      default:
        return UserType.none;
    }
  }

  void setUser(UserModel userModel) {
    UserController userController = Get.put(UserController());
    userController.setUser(userModel);
  }
}
