import 'dart:async';
import 'package:lib.core.rx/rx.dart';

abstract class ISubject<T> implements StreamController<T> {
  IObservable<T> get observable;
}