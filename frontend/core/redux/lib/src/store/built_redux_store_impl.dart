import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';
import 'istore.dart';
import 'package:lib.core.rx/rx.dart';

class BuiltReduxStoreImpl <TState extends Built<TState, TStateBuilder>, TStateBuilder extends Builder<TState, TStateBuilder>, TActions extends ReduxActions> implements IStore<TState, TActions> {

  final Store<TState, TStateBuilder, TActions> store;

  BuiltReduxStoreImpl(Reducer<TState, TStateBuilder, dynamic> reducer, TState defaultState, TActions actions, {
    Iterable<Middleware<TState, TStateBuilder, TActions>> middleware: const [],
  }) : store =  new Store(reducer, defaultState, actions, middleware: middleware);


  @override
  IObservable<TLocalState> onLocalChange<TLocalState>(ISelector<TState, TLocalState> converter) {
    return onStateChange.map(converter).distinct();
  }

  @override
  IObservable<TState> get onStateChange => new ObservableImpl(store.stream.map((change) => change.next));

  @override
  TActions get actions => store.actions;
}
