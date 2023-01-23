import 'package:flutter/material.dart';
import '../constants/constants.dart';

showSuccessTypeSnackbar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 1200),
    behavior: SnackBarBehavior.floating,
    backgroundColor: ColorConstants.successSnackbarColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    content: SizedBox(
      height: screenHeight(context) * 0.020,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .primaryTextTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    ),
  ));
}

showFailureTypeSnackbar({
  required BuildContext context,
  required String text,
  EdgeInsets? margin,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 1200),
    behavior: SnackBarBehavior.floating,
    backgroundColor: ColorConstants.failureSnackbarColor,
    margin: margin,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    content: SizedBox(
      height: screenHeight(context) * 0.020,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .primaryTextTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    ),
  ));
}
