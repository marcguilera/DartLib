import 'package:flutter/material.dart';
import 'package:lib.core.di/di.dart';
import 'package:meta/meta.dart';
import 'package:quiver/check.dart';

/// [InheritedWidget] holding a reference to the [IInjector].
/// This should be created at the top of the widget tree and use
/// [InjectorWidget.getInjector] to retrieve the instance.
class InjectorWidget extends InheritedWidget {
  final IInjector injector;

  InjectorWidget({
    Key key,
    @required this.injector,
    @required Widget child,
  }): super (key: key, child: child) {
    checkNotNull(injector, message: () => 'injector is null');
  }

  @override
  bool updateShouldNotify(InjectorWidget oldWidget) {
    return injector != oldWidget.injector;
  }

  /// Gets the [IInjector] for this context. Remember to add a [InjectorWidget]
  /// at the top of the widget tree.
  static IInjector getInjector(BuildContext context) {
    final InjectorWidget widget = context.inheritFromWidgetOfExactType(InjectorWidget);
    return widget?.injector;
  }

}