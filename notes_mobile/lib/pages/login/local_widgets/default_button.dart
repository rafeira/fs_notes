import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      this.title = 'CLIQUE',
      this.titleColor = Colors.white,
      this.backgroundColor = const Color.fromARGB(255, 34, 114, 37),
      this.splashColor = const Color.fromARGB(255, 6, 89, 9),
      this.borderColor = const Color.fromARGB(255, 6, 89, 9),
      this.radius = 20,
      this.borderWidth = 2.0,
      this.onTap});
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Color splashColor;
  final Color borderColor;
  final double radius;
  final double borderWidth;
  final GestureTapCallback? onTap;
  bool get isDisabled {
    return onTap == null;
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        TextStyle(color: titleColor, fontSize: 15, fontWeight: FontWeight.w700);
    return Material(
      color: isDisabled ? Colors.grey : backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        splashColor: splashColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  width: borderWidth,
                  color: isDisabled ? Colors.grey[700]! : borderColor),
              borderRadius: BorderRadius.circular(radius)),
          child: Text(
            title.toUpperCase(),
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}
