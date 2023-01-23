import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final bool loading;
  final bool enable;
  final Color? backgroundColor;
  final ButtonStyle? buttonStyle;

  const CustomElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
    this.loading = false,
    this.backgroundColor,
    this.buttonStyle,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? () => onPressed() : null,
      child: loading
          ? const Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            )
          : Text(buttonText),
      style: buttonStyle ?? ElevatedButton.styleFrom(
        primary: backgroundColor
      ),
    );
  }
}
