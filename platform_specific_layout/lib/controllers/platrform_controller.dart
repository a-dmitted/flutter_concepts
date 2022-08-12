import 'package:flutter/material.dart';

class PlatformController extends ChangeNotifier {
  PlatformController(BuildContext context)
      : _targetPlatform = Theme.of(context).platform;

  TargetPlatform _targetPlatform;

  TargetPlatform get targetPlatform => _targetPlatform;

  set targetPlatform(TargetPlatform targetPlatform) {
    _targetPlatform = targetPlatform;
    notifyListeners();
  }
}
