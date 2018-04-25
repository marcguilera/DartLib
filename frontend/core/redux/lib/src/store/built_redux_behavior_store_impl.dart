import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';
import 'built_redux_store_impl.dart';
import 'istore.dart';
import 'package:lib.core.rx/rx.dart';

class BehaviorBuiltReduxStoreImpl <TState extends Built<TState, TStateBuilder>, TStateBuilder extends Builder<TState, TStateBuilder>, TActions extends ReduxActions> extends BuiltReduxStoreImpl<TState, TStateBuilder, TActions> implements IStore<TState, TActions> {
  BehaviorBuiltReduxStoreImpl(Reducer<TState, TStateBuilder, dynamic> reducer, TState defaultState, TActions actions, {
  Iterable<Middleware<TState, TStateBuilder, TActions>> middleware: const [],
}) : super(reducer, defaultState, actions, middleware: middleware);

  @override
  IObservable<TState> get onStateChange {
    final subject = new SubjectImpl.behavior(initialValue: store.state);
    final stream = super.onStateChange;
    subject.addStream(stream).then((_) => subject.close());
    return subject.observable;
  }

}

