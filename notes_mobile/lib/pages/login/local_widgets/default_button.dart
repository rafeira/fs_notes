import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton(
      {super.key,
      this.title = 'CLIQUE',
      this.titleColor = Colors.white,
      this.backgroundColor = const Color.fromARGB(255, 34, 114, 37),
      this.splashColor = const Color.fromARGB(255, 6, 89, 9),
      this.borderColor = const Color.fromARGB(255, 6, 89, 9),
      this.radius = 20,
      this.borderWidth = 2.0,
      this.onTap,
      this.onTapDown,
      this.onTapUp});
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Color splashColor;
  final Color borderColor;
  final double radius;
  final double borderWidth;
  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  bool get isDisabled {
    return widget.onTap == null;
  }

  var isSplashing = false;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        color: isSplashing
            ? const Color.fromARGB(255, 255, 255, 255)
            : widget.titleColor,
        fontSize: 15,
        fontWeight: FontWeight.w700);
    return Material(
      color: isDisabled ? Colors.grey : widget.backgroundColor,
      borderRadius: BorderRadius.circular(widget.radius),
      child: InkWell(
        onTap: widget.onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        borderRadius: BorderRadius.circular(widget.radius),
        splashColor: widget.splashColor,
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    width: widget.borderWidth,
                    color: isDisabled ? Colors.grey[700]! : widget.borderColor),
                borderRadius: BorderRadius.circular(widget.radius)),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: titleStyle,
              child: Text(
                widget.title.toUpperCase(),
              ),
            )),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => isSplashing = true);
    widget.onTapDown?.call(details);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => isSplashing = false);
    widget.onTapUp?.call(details);
  }
}
