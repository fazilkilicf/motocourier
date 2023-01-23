import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../controllers/auth_controller.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    Get.put(AuthController(), permanent: true);
    controller = AnimationController(
      duration: const Duration(seconds: (1)),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          PathConstants().splashLottieFile,
          controller: controller,
          animate: true,
          height: 250,
          repeat: true,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
