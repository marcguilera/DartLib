import 'dart:async';
import 'package:lib.core.rx/transformers.dart';

abstract class IObservable<T> extends Stream<T> {
  IObservable<T> distinct([bool equals(T previous, T next)]);
  IObservable<S> map<S>(S convert(T event));
  IObservable<List<T>> history([int maxItems]);
  IObservable<IObservableChange<T>> changes([DefaultValue defaultValueGetter]);
  IObservable<T> doOnData(void onData(T data));
  IObservable<T> skip(int count);
}
