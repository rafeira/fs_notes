import 'package:flutter/material.dart';
import 'package:notes_mobile/themes/main_theme.dart';

class SaveCredentialsCheckbox extends StatefulWidget {
  const SaveCredentialsCheckbox({super.key, this.onChanged});
  final void Function(bool?)? onChanged;
  @override
  State<SaveCredentialsCheckbox> createState() =>
      _SaveCredentialsCheckboxState();
}

class _SaveCredentialsCheckboxState extends State<SaveCredentialsCheckbox> {
  var value = false;

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
              color: value ? Colors.green : Colors.white,
              fontFamily: MainTheme.tiltWarpFontFamily),
          child: const Text('Relembrar-me?')),
      value: value,
    );
  }

  void onValuChanged(bool? value) {
    setState(() {
      this.value = value!;
    });
    widget.onChanged!(value);
  }
}
