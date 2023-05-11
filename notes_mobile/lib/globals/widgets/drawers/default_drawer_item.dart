import 'package:flutter/material.dart';

class DefaultDrawerItem extends StatelessWidget {
  const DefaultDrawerItem({super.key, this.title, this.onTap, this.titleColor});
  final String? title;
  final GestureTapCallback? onTap;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: InkWell(
        onTap: onTap,
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
