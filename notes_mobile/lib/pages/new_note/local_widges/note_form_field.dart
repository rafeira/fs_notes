import 'package:flutter/material.dart';

class NoteFormField extends StatelessWidget {
  const NoteFormField({super.key, this.maxLines, this.label});
  final int? maxLines;
  final String? label;
  final enabledBorder = const OutlineInputBorder(
      borderSide:
          BorderSide(width: .8, color: Color.fromARGB(255, 102, 100, 100)));
  final focusedBorder = const OutlineInputBorder(
      borderSide:
          BorderSide(width: .8, color: Color.fromARGB(255, 233, 233, 233)));
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: const Color.fromARGB(255, 70, 70, 70),
      decoration: InputDecoration(
        fillColor: Colors.red,
        label: _label(),
        alignLabelWithHint: true,
        enabledBorder: enabledBorder,
        focusColor: Colors.red,
        floatingLabelStyle: const TextStyle(color: Colors.white),
        focusedBorder: focusedBorder,
      ),
    );
  }

  Widget? _label() {
    if (label == null) return null;
    return Text(label!);
  }
}
