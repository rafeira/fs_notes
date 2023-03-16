import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard(
      {super.key,
      this.padding = const EdgeInsets.all(8.0),
      this.child,
      this.cardColor,
      this.elevation,
      this.margin,
      this.width});
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color? cardColor;
  final double? elevation;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: elevation,
        margin: margin,
        color: cardColor,
        child: Container(
          width: width,
          padding: padding,
          child: child,
        ));
  }
}
