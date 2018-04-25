import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'iobservable.dart';

abstract class IAsObservableFuture<T> implements Future<T> {
  IObservable<T> asObservable();
}