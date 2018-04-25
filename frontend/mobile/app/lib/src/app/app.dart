import 'package:flutter/material.dart';
import 'package:lib.core.di/injector.dart';
import 'package:meta/meta.dart';
import 'package:quiver/check.dart';
import 'injector_widget.dart';

class App extends StatelessWidget {

  final IInjector injector;
  final Widget home;
  final RouteFactory onGenerateRoute;
  final ThemeData theme;

  App({
    Key key,
    @required this.injector,
    this.home,
    this.onGenerateRoute,
    this.theme,
  }): super(key: key) {
    checkNotNull(injector, message: () => 'injector is null');
  }

  @override
  Widget build(BuildContext context) {
    return  InjectorWidget(
      injector: injector,
      child:  MaterialApp(
        home: home,
        onGenerateRoute: onGenerateRoute,
        theme: theme,
      )
    );
  }

  /// Gets the [IInjector] for this app.
  static IInjector getInjector(BuildContext context) {
    return InjectorWidget.getInjector(context);
  }

}