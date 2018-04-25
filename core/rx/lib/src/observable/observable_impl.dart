import 'dart:async';
import 'observable_base.dart';
import 'iobservable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:lib.core.rx/transformers.dart';

class ObservableImpl<T> extends ObservableBase<T> implements IObservable<T> {

  ObservableImpl(Stream<T> stream) : super(new Observable(stream));

  factory ObservableImpl.just(T value) {
    return new ObservableImpl(new Observable.just(value));
  }

  factory ObservableImpl.periodic(Duration duration, [T computation(int computationCount)]) {
    return new ObservableImpl(new Observable.periodic(duration, computation));
  }

  factory ObservableImpl.fromFuture(Future<T> future) {
    return new ObservableImpl(new Observable.fromFuture(future));
  }

  @override
  IObservable<IObservableChange<T>> changes([DefaultValue defaultValueGetter]) {
    final transformation = new ChangeStreamTransformer<T>(defaultValueGetter: defaultValueGetter);
    final newStream = observable.transform(transformation);
    return new ObservableImpl(newStream);
  }

  @override
  IObservable<List<T>> history([int maxItems]) {
    final transformation = new HistoryStreamTransformer<T>(maxItems: maxItems);
    final newStream = observable.transform(transformation);
    return new ObservableImpl(newStream);
  }

}
