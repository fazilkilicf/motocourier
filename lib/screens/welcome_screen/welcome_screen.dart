import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motocourier/constants/constants.dart';
import 'package:motocourier/controllers/auth_controller.dart';
import 'package:motocourier/screens/register_screen/register_screen.dart';

import '../../utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(title: const Text('Welcome'),), */
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              const SizedBox(height: 64.0),
              Text(TextConstants.userTypeText,
                  style: title2TextStyle.copyWith(
                      color: ColorConstants.primaryColor)),
              const SizedBox(height: 32.0),
              buildElement(
                  icon: Icons.person,
                  title: TextConstants.customerText,
                  subTitle: TextConstants.customerDescriptionText,
                  onPressed: () {
                    debugPrint("Customer User");
                    Get.to(() => const RegisterScreen(
                          userType: UserType.customer,
                        ));
                  }),
              const SizedBox(height: 32.0),
              buildElement(
                  icon: Icons.motorcycle,
                  title: TextConstants.motoCourierText,
                  subTitle: TextConstants.motoCourierDescriptionText,
                  onPressed: () {
                    debugPrint("Motocourier User");
                    Get.to(() => const RegisterScreen(
                          userType: UserType.courier,
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildElement(
      {required IconData icon,
      required String title,
      required String subTitle,
      required Function onPressed}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () => onPressed(),
        child: Ink(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.amber.shade400,
              border: Border.all(color: Colors.white54),
              borderRadius: BorderRadius.circular(16.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 32.0),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleTextStyle.copyWith(fontSize: 24.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subTitle,
                      style: subTitleTextStyle.copyWith(fontSize: 12.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.motorcycle,
            color: ColorConstants.primaryColor, size: 48.0),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextConstants.brandText,
              style:
                  titleTextStyle.copyWith(color: ColorConstants.primaryColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              TextConstants.sloganText,
              style: subTitleTextStyle.copyWith(
                  color: ColorConstants.primaryColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
