import 'package:lib.frontend.core.redux/redux.dart';
import 'package:lib.frontend.core.shared/controllers.dart';
import 'package:lib.core.di/di.dart';

abstract class BuiltReduxControllerBase <TState, TActions> implements IController {

  final IStore<TState, TActions> store;

  BuiltReduxControllerBase(IInjector injector): store = singletonNotNull(injector, IStore);

}