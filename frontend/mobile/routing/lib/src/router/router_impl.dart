import 'package:flutter/material.dart';
import 'irouter.dart';
import 'package:fluro/fluro.dart';

class RouterImpl extends Router implements IRouter {

  @override
  Route generate(RouteSettings routeSettings) => generator(routeSettings);

}