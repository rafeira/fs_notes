import 'package:flutter/material.dart';
import 'package:notes_mobile/themes/main_theme.dart';

class SaveCredentialsCheckbox extends StatefulWidget {
  SaveCredentialsCheckbox({super.key, this.onChanged, required this.value});
  final void Function(bool?)? onChanged;
  bool value;
  @override
  State<SaveCredentialsCheckbox> createState() =>
      _SaveCredentialsCheckboxState();
}

class _SaveCredentialsCheckboxState extends State<SaveCredentialsCheckbox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: widget.onChanged != null ? onValuChanged : null,
      activeColor: Colors.green,
      title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
              color: widget.value ? Colors.green : Colors.white,
              fontFamily: MainTheme.tiltWarpFontFamily),
          child: const Text('Relembrar-me?')),
      value: widget.value,
    );
  }

  void onValuChanged(bool? value) {
    setState(() {
      widget.value = value!;
    });
    widget.onChanged!(value);
  }
}
