import 'package:lib.core.rx/rx.dart';

typedef TLocalState ISelector<TState, TLocalState>(TState state);

/// Represents a Redux store
abstract class IStore<TState, TActions> {
  /// A stream that gets warned on state changes.
  IObservable<TState> get onStateChange;

  /// Only emits when the local state changes.
  IObservable<TLocalState> onLocalChange<TLocalState>(ISelector<TState, TLocalState> mapper);

  TActions get actions;
}