import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_concept/controllers/navigation_controller.dart';
import 'package:navigation_concept/utils/types.dart';

class SimpleRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier {
  SimpleRouterDelegate(
      {required this.navigationController,
      required this.builder,
      this.onPopRoute}) {
    navigationController.addListener(notifyListeners);
  }

  final NavigationController navigationController;
  WidgetBuilder builder;
  SimpleRouterDelegatePopRoute? onPopRoute;

  //returns route information to the browser
  @override
  RouteInformation? get currentConfiguration {
    return navigationController.route;
  }

  //sets the route receviet from the browser
  @override
  Future<void> setNewRoutePath(RouteInformation configuration) {
    navigationController.route = configuration;
    return SynchronousFuture<void>(null);
  }

  @override
  Future<bool> popRoute() {
    return onPopRoute?.call() ?? SynchronousFuture<bool>(true);
  }

  @override
  Widget build(BuildContext context) => builder(context);

  @override
  void dispose() {
    navigationController.removeListener(notifyListeners);
    navigationController.dispose();
    super.dispose();
  }
}
