import 'package:flutter/services.dart';

class InputFormatters {
  TextInputFormatter onlyTextInputFormatter() {
    return FilteringTextInputFormatter(RegExp("[a-zA-ZşçüğöıəÖÇŞȘṢÜĞƏIİ ]*"),
        allow: true);
  }

  TextInputFormatter onlyNumberInputFormatter() {
    return FilteringTextInputFormatter(RegExp("[0-9]*"), allow: true);
  }

  TextInputFormatter emailInputFormatter() {
    return FilteringTextInputFormatter(RegExp("[a-z0-9ə@._ ]*"), allow: true);
  }

  TextInputFormatter onlyTextAndNumberInputFormatter() {
    return FilteringTextInputFormatter(RegExp("[a-zA-Z0-9şçüğöıəÖÇŞȘṢÜĞƏIİ]*"),
        allow: true);
  }

  TextInputFormatter onlyTextAndNumberInputFormatterLongText() {
    return FilteringTextInputFormatter(
        RegExp("[a-zA-Z0-9şçüğöıəÖÇŞȘṢÜĞƏIİ .,]*"),
        allow: true);
  }

  TextInputFormatter forPasswordTextInputFormatter() {
    return FilteringTextInputFormatter(
        RegExp(
            "[a-zA-Z0-9şçüğöıəÖÇŞȘṢÜĞƏIİ!@#%^&*/?><|}{+=)(-;: .‘’‛‟“”′´″`,-_€₺₼\"'.*\n]*"),
        allow: true);
  }

  TextInputFormatter allowNewLineFormatter() {
    return FilteringTextInputFormatter(RegExp("^[^#\r\n].*"), allow: true);
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String newText = newValue.text.toUpperCase();
    // return TextEditingValue(
    //   text: newValue.text.toUpperCase(),
    //   selection: newValue.selection,
    // );
    return newValue.copyWith(text: newText);
  }
}
