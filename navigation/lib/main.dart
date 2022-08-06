import 'package:flutter/material.dart';
import 'package:navigation_concept/controllers/navigation_controller.dart';
import 'package:navigation_concept/routing/route_information_parser.dart';
import 'package:navigation_concept/routing/router_delegate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  late final NavigationController _navigationController;
  late final SimpleRouterDelegate _simpleRouterDelegate;

  @override
  void initState() {
    _navigationController = NavigationController();

    _simpleRouterDelegate = SimpleRouterDelegate(
        navigationController: _navigationController,
        builder: (BuildContext context) => _navigationController.renderApp());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _navigationController)
        ],
        child: MaterialApp.router(
          routerDelegate: _simpleRouterDelegate,
          routeInformationParser: SimpleRouteInformationParser(),
        ));
  }
}
