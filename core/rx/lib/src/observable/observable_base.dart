import 'dart:async';
import 'package:lib.core.rx/src/observable/iobservable.dart';
import 'package:rxdart/rxdart.dart';
import 'iobservable.dart';
import 'observable_impl.dart';
import 'ias_observable_future.dart';
import 'as_observable_future_impl.dart';

abstract class ObservableBase<T> implements IObservable<T> {

  @override
  IAsObservableFuture<T> get single => new AsObservableFutureImpl(observable.single);

  @override
  IAsObservableFuture<T> get last => new AsObservableFutureImpl(observable.last);

  @override
  IAsObservableFuture<T> get first => new AsObservableFutureImpl(observable.first);

  @override
  bool get isBroadcast => observable.isBroadcast;

  final Observable<T> observable;

  ObservableBase(Stream<T> stream) : observable = new Observable(stream);

  @override
  IObservable<T> doOnData(void Function(T data) onData) {
    return new ObservableImpl(observable.doOnData(onData));
  }

  @override
  IObservable<S> map<S>(S Function(T event) convert) {
    return new ObservableImpl(observable.map(convert));
  }

  @override
  IObservable<T> distinct([bool equals(T previous, T next)]) {
    return new ObservableImpl(observable.distinct(equals));
  }

  @override
  IObservable<T> skip(int count) {
    return new ObservableImpl(observable.skip(count));
  }

  @override
  IAsObservableFuture<T> elementAt(int index) {
    return new AsObservableFutureImpl(observable.elementAt(index));
  }

  @override
  IAsObservableFuture<T> singleWhere(bool test(T element), {T orElse()}) {
    return new AsObservableFutureImpl(observable.singleWhere(test, orElse: orElse));
  }

  @override
  IAsObservableFuture<T> lastWhere(bool test(T element),
      {dynamic defaultValue(), T orElse()}) {
    return new AsObservableFutureImpl(observable.lastWhere(test, defaultValue: defaultValue, orElse: orElse));
  }

  @override
  IObservable<T> skipWhile(bool test(T element)) {
    return new ObservableImpl(observable.skipWhile(test));
  }

  @override
  IObservable<T> takeWhile(bool test(T element)) {
    return new ObservableImpl(observable.takeWhile(test));
  }

  @override
  Stream<T> take(int count) {
    return new ObservableImpl(observable.take(count));
  }

  @override
  IAsObservableFuture<E> drain<E>([E IAsObservableFutureValue]) {
    return new AsObservableFutureImpl(observable.drain(IAsObservableFutureValue));
  }

  @override
  IAsObservableFuture<Set<T>> toSet() {
    return new AsObservableFutureImpl(observable.toSet());
  }

  @override
  IAsObservableFuture<List<T>> toList() {
    return new AsObservableFutureImpl(observable.toList());
  }

  @override
  IObservable<R> retype<R>() {
    return new ObservableImpl(observable.retype());
  }

  @override
  IObservable<R> cast<R>() {
    return new ObservableImpl(observable.cast());
  }

  @override
  IAsObservableFuture<bool> get isEmpty => new AsObservableFutureImpl(observable.isEmpty);

  @override
  IAsObservableFuture<int> get length => new AsObservableFutureImpl(observable.length);

  @override
  IAsObservableFuture<bool> any(bool test(T element)) {
    return new AsObservableFutureImpl(observable.any(test));
  }

  @override
  IAsObservableFuture<bool> every(bool test(T element)) {
    return new AsObservableFutureImpl(observable.every(test));
  }

  @override
  IAsObservableFuture forEach(void action(T element)) {
    return new AsObservableFutureImpl(observable.forEach(action));
  }

  @override
  IAsObservableFuture<bool> contains(Object needle) {
    return new AsObservableFutureImpl(observable.contains(needle));
  }

  @override
  IAsObservableFuture<String> join([String separator = ""]) {
    return new AsObservableFutureImpl(observable.join(separator));
  }

  @override
  IAsObservableFuture<S> fold<S>(S initialValue, S combine(S previous, T element)) {
    return new AsObservableFutureImpl(observable.fold(initialValue, combine));
  }

  @override
  IAsObservableFuture<T> reduce(T combine(T previous, T element)) {
    return new AsObservableFutureImpl(observable.reduce(combine));
  }

  @override
  IObservable<S> transform<S>(StreamTransformer<T, S> streamTransformer) {
    return new ObservableImpl(observable.transform(streamTransformer));
  }

  @override
  IAsObservableFuture pipe(StreamConsumer<T> streamConsumer) {
    return new AsObservableFutureImpl(observable.pipe(streamConsumer));
  }

  @override
  IObservable<S> expand<S>(Iterable<S> convert(T element)) {
    return new ObservableImpl(observable.expand(convert));
  }

  @override
  IObservable<T> handleError(Function onError, {bool test(dynamic error)}) {
    return new ObservableImpl(observable.handleError(onError, test: test));
  }

  @override
  IObservable<E> asyncExpand<E>(Stream<E> convert(T event)) {
    return new ObservableImpl(observable.asyncExpand(convert));
  }

  @override
  IObservable<E> asyncMap<E>(FutureOr<E> convert(T event)) {
    return new ObservableImpl(observable.asyncMap(convert));
  }

  @override
  IObservable<T> where(bool test(T event)) {
    return new ObservableImpl(observable.where(test));
  }

  @override
  StreamSubscription<T> listen(void onData(T event), {Function onError, void onDone(), bool cancelOnError}) {
    return observable.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  @override
  Stream<T> timeout(Duration timeLimit, {void onTimeout(EventSink<T> sink)}) {
    return new ObservableImpl(observable.timeout(timeLimit, onTimeout: onTimeout));
  }

  @override
  IAsObservableFuture<T> firstWhere(bool test(T element), {dynamic defaultValue(), T orElse()}) {
    return new AsObservableFutureImpl(observable.firstWhere(test));
  }

  @override
  Stream<T> asBroadcastStream({
    void onListen(StreamSubscription<T> subscription),
    void onCancel(StreamSubscription<T> subscription)
  }) {
    return new ObservableImpl(observable.asBroadcastStream(onListen: onListen, onCancel: onCancel));
  }


}
