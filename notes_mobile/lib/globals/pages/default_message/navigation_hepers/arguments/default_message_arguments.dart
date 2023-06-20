import 'package:flutter/material.dart';

class DefaultMessageArguments {
  String message;
  String? assetImage;
  VoidCallback? confirmButtonCallback;
  VoidCallback? declineButtonCallback;
  VoidCallback? pageCallback;
  Color? iconColor;
  String? confirmButtonText;
  TextAlign? textMessageAlignment;
  DefaultMessageArguments(
      {required this.message,
      this.assetImage,
      this.confirmButtonCallback,
      this.declineButtonCallback,
      this.pageCallback,
      this.confirmButtonText,
      this.textMessageAlignment,
      this.iconColor});
}
