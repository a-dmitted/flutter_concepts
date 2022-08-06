import 'package:flutter/material.dart';

typedef SimpleRouterDelegatePopRoute = Future<bool> Function();
typedef RouterReportRouterInformation = void Function(
    RouteInformation, RouteInformationReportingType);