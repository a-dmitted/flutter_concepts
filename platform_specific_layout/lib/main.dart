import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_specific_layout/controllers/platrform_controller.dart';
import 'package:platform_specific_layout/layout/adaptive_factory.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PlatformController>(
        create: (context) => PlatformController(context)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AdaptiveFactory(
      materialTheme: ThemeData(
        primarySwatch: Colors.blue,
        platform: Provider.of<PlatformController>(context, listen: true)
            .targetPlatform,
      ),
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
  TargetPlatform _targetPlatform = TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    _targetPlatform =
        Provider.of<PlatformController>(context, listen: true).targetPlatform;
    int platformIndex = _targetPlatform.index;
    return AdaptiveFactory.buildScaffold(
      title: Text(widget.title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Change platform:',
                  ),
                  AdaptiveFactory.buildDropDown(
                    context: context,
                    value: platformIndex,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<PlatformController>(context, listen: false)
                                .targetPlatform =
                            TargetPlatform.values.elementAt(value!);
                      });
                    },
                    items: TargetPlatform.values
                        .map((platform) => DropdownMenuItem(
                              value: platform.index,
                              child: Text(
                                TargetPlatform.values
                                    .elementAt(platform.index)
                                    .toString(),
                              ),
                            ))
                        .toList(),
                    valuesList: TargetPlatform.values,
                  ),
                ],
              ),
              const Spacer(),
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
      ),
    );
  }
}
