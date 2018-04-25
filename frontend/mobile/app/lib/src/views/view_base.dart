import 'package:flutter/material.dart';
import 'package:lib.frontend.core.shared/shared.dart';
import 'package:lib.core.di/di.dart';
import 'package:meta/meta.dart';
import 'package:quiver/check.dart';
import 'controller_widget.dart';

abstract class ViewBase <TController extends IController> extends StatefulWidget implements IView {

  final TController controller;

  ViewBase.fromInjector(IInjector injector):
        this(createNotNull(injector, TController));

  ViewBase(IController controller):
      controller = checkNotNull(controller, message: () => 'controller is null');

  @override
  _ViewBaseState createState() {
    return _ViewBaseState();
  }

  @protected
  Widget build(BuildContext context);

  @protected
  @mustCallSuper
  void deactivate() {}

  @protected
  @mustCallSuper
  void initState() {}

  @protected
  @mustCallSuper
  void dispose() {
    controller.closeSubjects();
  }

  static TController getController<TController extends IController>(BuildContext context) {
    return ControllerWidget.getController(context);
  }

}

class _ViewBaseState <TView extends ViewBase<IController>> extends State <TView> {
  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
      controller: widget.controller,
      child: widget.build(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.deactivate();
  }

  @override
  void initState() {
    super.initState();
    widget.initState();
  }

}