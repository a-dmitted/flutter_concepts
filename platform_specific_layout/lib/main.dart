import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_specific_layout/layout/adaptive_factory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AdaptiveFactory(
      materialTheme:
          ThemeData(primarySwatch: Colors.blue, platform: TargetPlatform.iOS),
      cupertinoTheme: const CupertinoThemeData(primaryColor: Colors.blue),
    );
    return AdaptiveFactory.buildApp(
        title: 'Platform Adaptive Layout',
        home: const MyHomePage(title: 'Platform Adaptive Layout'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return AdaptiveFactory.buildScaffold(
      title: Text(widget.title),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Change ThemeData.platform to set desired platform',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdaptiveFactory.buildTextButton(
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                AdaptiveFactory.buildSwitch(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
