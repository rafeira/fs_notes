import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard(
      {super.key,
      this.padding = const EdgeInsets.all(8.0),
      this.child,
      this.cardColor});
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final Color? cardColor;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: cardColor,
        child: Padding(
          padding: padding,
          child: child,
        ));
  }
}
