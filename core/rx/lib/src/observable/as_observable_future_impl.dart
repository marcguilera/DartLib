import 'package:lib.core.rx/src/observable/iobservable.dart';
import 'package:rxdart/futures.dart';
import 'observable_impl.dart';
import 'ias_observable_future.dart';
import 'dart:async';

class AsObservableFutureImpl<T> extends WrappedFuture<T> implements IAsObservableFuture<T> {

  AsObservableFutureImpl(Future<T> wrapped) : super(wrapped);

  @override
  IObservable<T> asObservable() {
    return new ObservableImpl.fromFuture(wrapped);
  }

}