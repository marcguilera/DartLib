import 'package:flutter/material.dart';

abstract class IRouteGenerator {
  Route generate(RouteSettings routeSettings);
}