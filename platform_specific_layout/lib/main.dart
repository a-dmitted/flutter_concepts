import 'package:flutter/material.dart';
import 'package:platform_specific_layout/layout/widget_factory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Adaptive Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS
      ),
      home: const MyHomePage(title: 'Platform Adaptive Layout'),
    );
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Change ThemeData.platform to set desired platform',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetFactory.buildButton(
                    context: context,
                    child: const Text('Button'),
                    onPressed: () {}),
                WidgetFactory.buildSwitch(
                    context: context,
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
