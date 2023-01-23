import 'dart:developer';

import 'package:get/get.dart';
import 'package:motocourier/widgets/custom_snackbar.dart';

class ErrorHandler {
  Future<String> authErrorHandler(String errorCode) async {
    log(errorCode);
    String errorMessage;
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        errorMessage = "Bu kullanıcı mevcut. Lütfen giriş yapınız.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        errorMessage = "Girdiğiniz şifre yanlış.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        errorMessage = "Kullanıcı bulunamadı.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        errorMessage = "Hesabınız engellendi!";
        break;
      case "operation-not-allowed":
        errorMessage =
            "Oturum açma limiti aşıldı. Lütfen daha sonra tekrar deneyiniz.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        errorMessage = "E-posta adresi yanlış.";
        break;
      case "invalid-verification-code":
        errorMessage = "SMS kodu doğru değil.";
        break;
      default:
        errorMessage = "İnternet bağlantınızı kontrol edin.";
        break;
    }

    showFailureTypeSnackbar(context: Get.context!, text: errorMessage);

    return errorMessage;
  }

  Future firestoreErrorHandler(String errorCode) async {}

  Future firestoreUserErrorHandler(String errorCode) async {}
}
