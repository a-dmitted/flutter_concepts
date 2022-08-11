import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformSwitch {
  factory PlatformSwitch(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android: return ShowAndroidSwitch();
      case TargetPlatform.iOS: return ShowIosSwitch();
      default: return ShowAndroidSwitch();
    }
  }

  Widget build({
    required BuildContext context,
    required bool value,
    required ValueChanged<bool> onChanged
  });
}

class ShowAndroidSwitch implements PlatformSwitch {
  @override
  Widget build({
    required BuildContext context,
    required bool value,
    required ValueChanged<bool> onChanged
  }) {

    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}

class ShowIosSwitch implements PlatformSwitch {
  @override
  Widget build({
    required BuildContext context,
    required bool value,
    required ValueChanged<bool> onChanged
  }) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}