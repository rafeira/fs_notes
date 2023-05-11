import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar(
      {super.key,
      this.backgroundColor,
      this.elevation,
      this.actions,
      this.leading});
  final Color? backgroundColor;
  final double? elevation;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Size get preferredSize => const Size.fromHeight(40);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      actions: actions,
    );
  }
}
