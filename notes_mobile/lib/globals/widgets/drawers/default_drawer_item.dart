import 'package:flutter/material.dart';

class DefaultDrawerItem extends StatelessWidget {
  const DefaultDrawerItem(
      {super.key,
      this.title,
      this.onTap,
      this.titleColor,
      this.splashColor,
      this.buttonColor});
  final String? title;
  final GestureTapCallback? onTap;
  final Color? titleColor;
  final Color? splashColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor ?? Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            title ?? 'Clique',
            style: TextStyle(color: titleColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
