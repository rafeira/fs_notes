import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/pages/splash/controllers/splash_page_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final _controller = SplashPageController();
  @override
  void initState() {
    _controller.initializeAnimations(this);
    super.initState();
    _controller.startAnimations(context);
  }

  @override
  void dispose() {
    _controller.disposeAnimations();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: AnimatedBuilder(
          animation: _controller.positionAnimation,
          builder: (_, __) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: _controller.positionAnimation.value,
                    child: AnimatedBuilder(
                        animation: _controller.sizeAnimation,
                        builder: (_, __) {
                          return Image(
                            image: const AssetImage('assets/icons/notes.png'),
                            height: _controller.sizeAnimation.value,
                            width: _controller.sizeAnimation.value,
                          );
                        })),
              ],
            );
          }),
    );
  }
}
