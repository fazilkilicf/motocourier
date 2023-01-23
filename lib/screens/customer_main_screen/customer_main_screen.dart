import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motocourier/controllers/auth_controller.dart';
import 'package:motocourier/controllers/user_controller.dart';

import '../../widgets/custom_elevated_button.dart';

class CustomerMainScreen extends StatefulWidget {
  const CustomerMainScreen({Key? key}) : super(key: key);

  @override
  State<CustomerMainScreen> createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
  AuthController authController = Get.find();
  UserController userController = Get.find();

  Future logOutProcess() async => authController.logOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Müşteri Ana Ekran"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            const Text("Müşteri",style: TextStyle(fontWeight: FontWeight.bold),),
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
    );
  }
}
