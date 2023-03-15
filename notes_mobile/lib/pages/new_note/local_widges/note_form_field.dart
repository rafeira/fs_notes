import 'package:flutter/material.dart';

class NoteFormField extends StatelessWidget {
  const NoteFormField(
      {super.key, this.maxLines, this.label, this.controller, this.validator, this.autovalidateMode});
  final int? maxLines;
  final String? label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  OutlineInputBorder _border(Color color) =>
      OutlineInputBorder(borderSide: BorderSide(width: .8, color: color));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      autovalidateMode: autovalidateMode,
      cursorColor: const Color.fromARGB(255, 70, 70, 70),
      decoration: InputDecoration(
        fillColor: Colors.red,
        label: _label(),
        alignLabelWithHint: true,
        enabledBorder: _border(const Color.fromARGB(255, 102, 100, 100)),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(const Color.fromARGB(255, 250, 151, 151)),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        focusedBorder: _border(Colors.white),
      ),
    );
  }

  Widget? _label() {
    if (label == null) return null;
    return Text(label!);
  }
}
