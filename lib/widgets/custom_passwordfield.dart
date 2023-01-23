import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/input_formatters.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {Key? key,
      this.width,
      required this.height,
      this.obscureValue = true,
      this.showSuffixIcon = true,
      this.suffixVisibleIcon,
      this.suffixHiddenIcon,
      this.padding,
      this.margin,
      required this.controller,
      this.style,
      this.enabled = true,
      this.readOnly = false,
      this.autoFocus = false,
      this.textInputAction = TextInputAction.done,
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
      this.onChanged,
      this.onTap})
      : super(key: key);

  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool obscureValue;
  final bool showSuffixIcon;
  final Widget? suffixVisibleIcon;
  final Widget? suffixHiddenIcon;
  final TextEditingController controller;
  final TextStyle? style;
  final bool enabled;
  final bool readOnly;
  final bool autoFocus;
  final TextInputAction textInputAction;
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

  final Function(String)? onChanged;
  final Function()? onTap;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool obscurePassword;

  @override
  void initState() {
    super.initState();
    obscurePassword = widget.obscureValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      child: TextField(
        obscureText: obscurePassword,
        enabled: widget.enabled,
        controller: widget.controller,
        style: widget.style,
        readOnly: widget.readOnly,
        autofocus: widget.autoFocus,
        keyboardType: TextInputType.text,
        textInputAction: widget.textInputAction,
        textCapitalization: TextCapitalization.none,
        inputFormatters: widget.formatters.isEmpty
            ? [InputFormatters().forPasswordTextInputFormatter()]
            : widget.formatters,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        decoration: InputDecoration(
          enabled: widget.enabled,
          filled: widget.filled,
          fillColor: widget.filledColor,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          enabledBorder: widget.enabledBorder,
          focusedBorder: widget.focusedBorder,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: widget.contentPadding,
          label: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: widget.labelText,
              style: widget.labelStyle,
            ),
            TextSpan(
              text: widget.isRequired ? ' * ' : '',
              style:
                  widget.isRequiredStyle ?? const TextStyle(color: Colors.red),
            )
          ])),
          prefixIcon: widget.prefixIcon,
          isDense: widget.isDense,
          suffixIcon: widget.showSuffixIcon
              ? GestureDetector(
                  onTap: () => setState(() {
                    obscurePassword = !obscurePassword;
                  }),
                  child: obscurePassword
                      ? widget.suffixHiddenIcon ??
                          Icon(
                            Icons.visibility_off,
                            size: 22,
                            color: Theme.of(context).primaryColor,
                          )
                      : widget.suffixVisibleIcon ??
                          Icon(
                            Icons.visibility,
                            size: 22,
                            color: Theme.of(context).primaryColor,
                          ),
                )
              : Container(),
        ),
        // other
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
