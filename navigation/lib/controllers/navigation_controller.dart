import 'package:flutter/material.dart';
import 'package:navigation_concept/models/basic_page_model.dart';
import 'package:navigation_concept/views/basic_page.dart';

class NavigationController extends RouteState {
  NavigationController() {
    basicPageModel = BasicPageModel(go);
  }

  late final BasicPageModel basicPageModel;

  Widget renderApp() {
    Widget toBeRendered;

    if (_route.location == '/') {
      basicPageModel.title = "I'm a main page";      
      basicPageModel.newRoute = '/page';
      toBeRendered = BasicPage(model: basicPageModel);
    } else if (_route.location == '/page') {
      basicPageModel.title = "I'm some other page";
      basicPageModel.newRoute = '/';
      toBeRendered = BasicPage(model: basicPageModel);
    } else {
      toBeRendered = Container();
    }

    return Navigator(
        onPopPage: (route, dynamic result) => route.didPop(result),
        pages: [MaterialPage(child: toBeRendered)]);
  }
}

class RouteState with ChangeNotifier {
  RouteState() : _route = const RouteInformation(location: '/');
  RouteInformation _route;
  RouteInformation get route => _route;

  set route(RouteInformation route) {
    // Don't notify listeners if the path hasn't changed.
    if (_route.location == route.location) return;
    _route = route;
    notifyListeners();
  }

  void go(RouteInformation routeInformation) {
    route = routeInformation;
  }
}
