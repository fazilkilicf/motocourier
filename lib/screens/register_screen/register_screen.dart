import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motocourier/constants/enums.dart';
import 'package:motocourier/screens/login_screen/login_screen.dart';
import 'package:motocourier/widgets/custom_text_button.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_emailfield.dart';
import '../../widgets/custom_passwordfield.dart';
import '../../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.userType}) : super(key: key);

  final UserType userType;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthController authController = Get.put(AuthController());

  Future registerProcess() async {
    await authController.signUp(userType: widget.userType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              height: 36.0,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              margin: const EdgeInsets.only(top: 40.0),
              controller: authController.nameController,
              filled: true,
              filledColor: Theme.of(context).inputDecorationTheme.fillColor,
              prefixIcon: const Icon(Icons.person),
              hintText: "Adınız",
              labelText: "Adınız",
              labelStyle: const TextStyle(fontSize: 13.0, color: Colors.black),
              isRequired: true,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            CustomTextField(
              height: 36.0,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              margin: const EdgeInsets.only(top: 40.0),
              controller: authController.surnameController,
              filled: true,
              filledColor: Theme.of(context).inputDecorationTheme.fillColor,
              prefixIcon: const Icon(Icons.person),
              hintText: "Soyadınız",
              labelText: "Soyadınız",
              labelStyle: const TextStyle(fontSize: 13.0, color: Colors.black),
              isRequired: true,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
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
              labelStyle: const TextStyle(fontSize: 13.0, color: Colors.black),
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
              labelStyle: const TextStyle(fontSize: 13.0, color: Colors.black),
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
              controller: authController.passwordAgainController,
              filled: true,
              filledColor: Theme.of(context).inputDecorationTheme.fillColor,
              prefixIcon: const Icon(Icons.key),
              hintText: "Tekrar Şifreniz",
              labelText: "Tekrar Şifreniz",
              labelStyle: const TextStyle(fontSize: 13.0, color: Colors.black),
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
                buttonText: "Kayıt Ol",
                onPressed: () => registerProcess(),
                backgroundColor: Colors.amber,
                enable: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hesabınız var mı?"),
                  CustomTextButton(
                      buttonText: "Giriş yap",
                      buttonTextStyle: const TextStyle(color: Colors.amber),
                      onPressed: () => Get.to(() => const LoginScreen()))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
