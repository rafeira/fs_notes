import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator(
      {super.key,
      required this.divider,
      this.isBig = true,
      this.duration = const Duration(milliseconds: 500)});

  final SizedBox divider;
  final bool isBig;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: duration,
            height: isBig ? 50.0 : 0,
            width: isBig ? 50.0 : 0,
            child: const CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        ),
        divider
      ],
    );
  }
}
