import 'package:flutter/material.dart';
import 'package:lib.frontend.core.shared/controllers.dart';
import 'package:quiver/check.dart';

class ControllerWidget <T extends IController> extends InheritedWidget {

  final T controller;

  ControllerWidget({Key key, this.controller, Widget child}): super(key: key, child: child)  {
    checkNotNull(controller, message: () => 'controller is null');
  }

  @override
  bool updateShouldNotify(ControllerWidget<T> oldWidget) {
    return controller != oldWidget.controller;
  }

  static T getController<T>(BuildContext context) {
    final ControllerWidget widget = context.inheritFromWidgetOfExactType(ControllerWidget);
    return widget?.controller as T;
  }

}