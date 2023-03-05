import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard(
      {super.key, this.padding = const EdgeInsets.all(8.0), this.child});
  final EdgeInsetsGeometry padding;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: padding,
      child: child,
    ));
  }
}
