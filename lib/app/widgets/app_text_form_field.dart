import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_separator/app/core/helpers/form/form_utils.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enabled;
  final bool? autofocus;
  final int? maxLength;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.decoration,
    this.inputFormatters,
    this.textCapitalization,
    this.labelText,
    this.hintText,
    this.errorText,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textStyle,
    this.textAlign,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
    this.enabled,
    this.autofocus,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormatters,
      onChanged: ((value) => onChanged != null ? onChanged!(value) : null),
      obscureText: obscureText ?? false,
      enabled: enabled ?? true,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      textInputAction: textInputAction,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      maxLength: maxLength,
      style: textStyle ?? const TextStyle(),
      onFieldSubmitted: (value) => nextFocusNode != null
          ? FormUtils.changeFieldFocus(focusNode!, nextFocusNode!)
          : onFieldSubmitted != null
              ? onFieldSubmitted!(value)
              : null,
      decoration: decoration ?? const InputDecoration(),
    );
  }
}
