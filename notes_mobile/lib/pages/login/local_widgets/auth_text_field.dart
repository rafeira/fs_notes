import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      this.hintText,
      required this.controller,
      this.suffix,
      this.textInputType,
      this.label,
      this.validator,
      this.onFieldSubmitted,
      this.isTextObscure = false, this.enabled});
  final String? hintText;
  final TextEditingController controller;
  final Widget? suffix;
  final TextInputType? textInputType;
  final String? label;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool isTextObscure;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      obscureText: isTextObscure,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          suffix: suffix,
          hintText: hintText,
          label: label == null
              ? null
              : Text(
                  label!,
                ),
          labelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              background: Paint()..color = Colors.white),
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true),
    );
  }
}
