import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final TextStyle buttonTextStyle;
  final Function onPressed;
  const CustomTextButton(
      {Key? key,
      required this.buttonText,
      required this.buttonTextStyle,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        buttonText,
        style: buttonTextStyle,
      ),
      onPressed: () => onPressed(),
    );
  }
}
