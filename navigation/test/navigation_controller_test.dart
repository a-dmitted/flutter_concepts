import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_concept/controllers/navigation_controller.dart';
import 'package:navigation_concept/routing/router_delegate.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Simple router basic functionality - synchronized',
      (WidgetTester tester) async {
    NavigationController navigationController = NavigationController();
    SimpleRouterDelegate simpleRouterDelegate = SimpleRouterDelegate(
        navigationController: navigationController,
        builder: (BuildContext context) => navigationController.renderApp());

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<NavigationController>(
            create: ((context) => navigationController),
          )
        ],
        child: MaterialApp.router(
          routerDelegate: simpleRouterDelegate,
        )));

    expect(find.text("I'm a main page"), findsOneWidget);
    expect(find.text("I'm some other page"), findsNothing);

    navigationController.go(const RouteInformation(location: "/page"));
    await tester.pump();

    expect(find.text("I'm a main page"), findsNothing);
    expect(find.text("I'm some other page"), findsOneWidget);
  });
}
