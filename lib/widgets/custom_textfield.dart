import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/input_formatters.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.width,
      required this.height,
      this.padding,
      this.margin,
      required this.controller,
      this.style,
      this.enabled = true,
      this.readOnly = false,
      this.autoFocus = false,
      this.textInputAction = TextInputAction.done,
      this.textCapitalization = TextCapitalization.sentences,
      this.formatters = const [],
      this.filled = false,
      this.filledColor,
      this.hintText,
      this.hintStyle,
      this.border = InputBorder.none,
      this.enabledBorder = InputBorder.none,
      this.focusedBorder = InputBorder.none,
      this.contentPadding = const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 0.0),
      this.labelText,
      this.labelStyle,
      this.isRequired = false,
      this.isRequiredStyle,
      this.prefixIcon,
      this.isDense = false,
      this.suffix,
      this.onChanged,
      this.onTap})
      : super(key: key);

  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextEditingController controller;
  final TextStyle? style;
  final bool enabled;
  final bool readOnly;
  final bool autoFocus;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> formatters;
  final bool filled;
  final Color? filledColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool isRequired;
  final TextStyle? isRequiredStyle;
  final Widget? prefixIcon;
  final bool isDense;
  final Widget? suffix;
  final Function(String)? onChanged;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: TextField(
        enabled: enabled,
        controller: controller,
        style: style,
        readOnly: readOnly,
        autofocus: autoFocus,
        keyboardType: TextInputType.text,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        inputFormatters: formatters.isEmpty
            ? [InputFormatters().onlyTextInputFormatter()]
            : formatters,
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          enabled: enabled,
          filled: filled,
          fillColor: filledColor,
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: contentPadding,
          label: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: labelText,
              style: labelStyle,
            ),
            TextSpan(
              text: isRequired ? ' * ' : '',
              style: isRequiredStyle ?? const TextStyle(color: Colors.red),
            )
          ])),
          prefixIcon: prefixIcon,
          isDense: isDense,
          suffix: suffix,
        ),
        // other
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
