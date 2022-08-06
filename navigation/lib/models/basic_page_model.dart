import 'package:flutter/widgets.dart';

class BasicPageModel {
  String title = '';
  String newRoute = '';

  BasicPageModel(this._go);
  final void Function(RouteInformation routeInformation) _go;

  void go() => _go(RouteInformation(location: newRoute));
}
