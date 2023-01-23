import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_emailfield.dart';
import '../../widgets/custom_passwordfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  Future signInProcess() async {
    await authController.signIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yap"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomEmailField(
                height: 36.0,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                margin: const EdgeInsets.only(top: 40.0),
                controller: authController.emailController,
                filled: true,
                filledColor: Theme.of(context).inputDecorationTheme.fillColor,
                prefixIcon: const Icon(Icons.email),
                hintText: "E-mail adresiniz",
                labelText: "E-mail adresiniz",
                labelStyle:
                    const TextStyle(fontSize: 13.0, color: Colors.black),
                isRequired: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              CustomPasswordField(
                height: 36.0,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                margin: const EdgeInsets.only(top: 40.0),
                controller: authController.passwordController,
                filled: true,
                filledColor: Theme.of(context).inputDecorationTheme.fillColor,
                prefixIcon: const Icon(Icons.key),
                hintText: "Şifreniz",
                labelText: "Şifreniz",
                labelStyle:
                    const TextStyle(fontSize: 13.0, color: Colors.black),
                isRequired: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              Container(
                width: double.infinity,
                height: 48.0,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                margin: const EdgeInsets.only(top: 40.0),
                child: CustomElevatedButton(
                  buttonText: "Giriş Yap",
                  onPressed: () => signInProcess(),
                  backgroundColor: Colors.amber,
                  enable: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
