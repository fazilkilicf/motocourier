import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/custom_elevated_button.dart';

class CourierMainScreen extends StatefulWidget {
  const CourierMainScreen({Key? key}) : super(key: key);

  @override
  State<CourierMainScreen> createState() => _CourierMainScreenState();
}

class _CourierMainScreenState extends State<CourierMainScreen> {
  AuthController authController = Get.find();
  UserController userController = Get.find();

  Future logOutProcess() async => authController.logOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kurye Ana Ekran"),
        centerTitle: true,
      ),
      body: GetBuilder<UserController>(
        builder: (userController) => SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40.0),
              const Text(
                "Kurye",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  "${userController.userModel?.name} ${userController.userModel?.surname}"),
              Text("${userController.userModel?.mail}"),
              Container(
                width: double.infinity,
                height: 48.0,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                margin: const EdgeInsets.only(top: 40.0),
                child: CustomElevatedButton(
                  buttonText: "Çıkış yap",
                  onPressed: () => logOutProcess(),
                  backgroundColor: Colors.amber,
                  enable: true,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
