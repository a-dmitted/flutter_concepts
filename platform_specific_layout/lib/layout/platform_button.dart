import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton {
  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return ShowAndroidButton();
      case TargetPlatform.iOS:
        return ShowIosButton();
      default:
        return ShowAndroidButton();
    }
  }

  Widget build(
      {required BuildContext context,
      required VoidCallback onPressed,
      required Widget child,
      ButtonType type = ButtonType.text});
}

enum ButtonType { text, filled }

class ShowAndroidButton implements PlatformButton {
  @override
  Widget build(
      {required BuildContext context,
      required Widget child,
      required VoidCallback onPressed,
      ButtonType type = ButtonType.text}) {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton(onPressed: onPressed, child: child);
      default:
        return TextButton(onPressed: onPressed, child: child);
    }
  }
}

class ShowIosButton implements PlatformButton {
  @override
  Widget build(
      {required BuildContext context,
      required Widget child,
      required VoidCallback onPressed,
      ButtonType type = ButtonType.text}) {
    switch (type) {
      case ButtonType.filled:
        return CupertinoButton.filled(onPressed: onPressed, child: child);
      default:
        return CupertinoButton(onPressed: onPressed, child: child);
    }
  }
}

