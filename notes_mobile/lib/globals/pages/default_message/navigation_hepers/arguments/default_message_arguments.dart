import 'package:flutter/material.dart';

class DefaultMessageArguments {
  String message;
  String? assetImage;
  VoidCallback? confirmButtonCallback;
  VoidCallback? declineButtonCallback;
  DefaultMessageArguments(
      {required this.message,
      this.assetImage,
      this.confirmButtonCallback,
      this.declineButtonCallback});
}
