import 'package:flutter/material.dart';
import 'package:platform_specific_layout/layout/platform_button.dart';
import 'package:platform_specific_layout/layout/platform_switch.dart';

class WidgetFactory {
  static Widget buildButton({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed
  }) {
    return PlatformButton(Theme.of(context).platform).build(
      context: context,
      child: child,
      onPressed: onPressed,
    );
  }

  static Widget buildSwitch({
    required BuildContext context,
    required bool value,
    required ValueChanged<bool> onChanged
  }) {
    return PlatformSwitch(Theme.of(context).platform).build(
      context: context,
      value: value,
      onChanged: onChanged,
    );
  }
}