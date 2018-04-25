import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../router/router_impl.dart';
import '../router/irouter.dart';
import 'package:lazy/lazy.dart';
import 'package:quiver/check.dart';
import 'package:quiver/strings.dart';
import 'not_found.dart';

typedef Widget RouteBuilder(BuildContext context, Map<String, List<String>> parameters);

class RouterBuilder {

  final _routerLazy = Lazy<RouterImpl>(() => RouterImpl());
  RouterImpl get _router => _routerLazy();

  RouterBuilder defineNotFound(RouteBuilder builder) {
    checkNotNull(builder, message: () => 'builder is null');
    _router.notFoundHandler = Handler(handlerFunc: builder);
    return this;
  }

  RouterBuilder define(String route, RouteBuilder builder) {
    checkArgument(isNotEmpty(route), message: () => 'route is null or empty');
    checkNotNull(builder, message: () => 'builder is null');
    _router.define(route, handler: Handler(handlerFunc: builder));
    return this;
  }

  RouterBuilder defineHome(RouteBuilder builder) {
    return define('/', builder);
  }

  IRouter build() {
    _router.notFoundHandler ??= _createNotFound();
    return _router;
  }

  Handler _createNotFound() {
    print('RouterBuilder: Setting default not found');
    return Handler(handlerFunc: (context, params) => new NotFound());
  }

}