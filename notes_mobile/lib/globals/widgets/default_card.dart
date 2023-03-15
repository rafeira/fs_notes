import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard(
      {super.key,
      this.padding = const EdgeInsets.all(8.0),
      this.child,
      this.cardColor,
      this.elevation});
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final Color? cardColor;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: elevation,
        color: cardColor,
        child: Padding(
          padding: padding,
          child: child,
        ));
  }
}
