import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../../../constants/constants.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
            backgroundColor: ColorConstants.primaryColor,
            radius: 48,
            child: Icon(Icons.motorcycle, color: Colors.white, size: 48)),
        SizedBox(
          height: 16.0,
        ),
        Text(TextConstants.brandText, style: brandTextStyle)
      ],
    );
  }
}
