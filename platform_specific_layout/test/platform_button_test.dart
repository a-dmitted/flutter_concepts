import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:platform_specific_layout/layout/platform_button.dart';

import 'platform_button_test.mocks.dart';

@GenerateMocks([BuildContext])
void main() {
  test("${DateTime.now()}: platform button test", (() {
    BuildContext context = MockBuildContext();
    Widget materialButton = PlatformButton(TargetPlatform.android).build(
        context: context, onPressed: () {}, child: const Text("any"));

    expect(true, materialButton is TextButton);        

    Widget cupertinoButton = PlatformButton(TargetPlatform.iOS).build(
        context: context, onPressed: () {}, child: const Text("any"));

    expect(true, cupertinoButton is CupertinoButton);
  }));
}




