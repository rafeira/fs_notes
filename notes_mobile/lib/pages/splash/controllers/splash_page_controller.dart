import 'package:flutter/material.dart';

class SplashPageController {
  late AnimationController _positionAnimationController;
  late Animation<double> positionAnimation;
  final _positionAnimationDuration = const Duration(seconds: 2);
  final _initialPosition = 0.0;
  double get _finalPosition => (_screenSize.height / 2) - _finalSize;

  late AnimationController _sizeAnimationController;
  late Animation<double> sizeAnimation;
  final _sizeAnimationDuration = const Duration(seconds: 1);
  final _initialSize = 50.0;
  double get _finalSize => 200;

  Size get _screenSize =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  void initializeAnimations(TickerProvider tickerProvider) {
    _initAnimationController(tickerProvider);
    _initPositionAnimation();
    _initSizeAnimationController(tickerProvider);
    _initSizeAnimation();
  }

  void _initAnimationController(TickerProvider tickerProvider) {
    _positionAnimationController = AnimationController(
        vsync: tickerProvider, duration: _positionAnimationDuration);
  }

  void _initPositionAnimation() {
    final curvedAnimation = CurvedAnimation(
        parent: _positionAnimationController, curve: Curves.easeInQuint);
    positionAnimation =
        Tween<double>(begin: _initialPosition, end: _finalPosition)
            .animate(curvedAnimation);
  }

  void _initSizeAnimationController(TickerProvider tickerProvider) {
    _sizeAnimationController = AnimationController(
        vsync: tickerProvider, duration: _sizeAnimationDuration);
  }

  void _initSizeAnimation() {
    sizeAnimation = Tween<double>(begin: _initialSize, end: _finalSize).animate(
        CurvedAnimation(parent: _sizeAnimationController, curve: Curves.ease));
  }

  void disposeAnimations() {
    _positionAnimationController.dispose();
    _sizeAnimationController.dispose();
  }

  void startAnimations(BuildContext context) {
    _animatePosition().then((_) => _animateSize()).then((_) => Future.delayed(
        const Duration(seconds: 1), () => _navigateToLogin(context)));
  }

  TickerFuture _animatePosition() {
    return _positionAnimationController.forward();
  }

  TickerFuture _animateSize() {
    return _sizeAnimationController.forward();
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }
}
