import 'dart:async';
import 'package:lib.core.rx/rx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/subjects/subject.dart';
import 'isubject.dart';
import 'subject_base.dart';

class SubjectImpl<T> extends SubjectBase<T> implements ISubject<T> {

  IObservable<T> get observable => new ObservableImpl(stream);

  SubjectImpl._(Subject<T> subject): super(subject);

  factory SubjectImpl.behavior({
    T initialValue,
    void onListen(),
    Future<dynamic> onCancel(),
    bool sync: false,
  }) {
    final subject = new BehaviorSubject<T>(
      seedValue: initialValue,
      onListen: onListen,
      onCancel: onCancel,
      sync: sync
    );
    return new SubjectImpl._(subject);
  }

  factory SubjectImpl.replay({
    int maxSize,
    void onListen(),
    Future onCancel(),
    bool sync: false,
  }) {
    final subject = new ReplaySubject<T>(
      maxSize: maxSize,
      onCancel: onCancel,
      onListen: onListen,
      sync: sync
    );
    return new SubjectImpl._(subject);
  }

  factory SubjectImpl.publish({
    void onListen(),
    Future onCancel(),
    bool sync: false,
  }) {
    final subject = new PublishSubject<T>(
      onCancel: onCancel,
      onListen: onListen,
      sync: sync
    );
    return new SubjectImpl._(subject);
  }

  factory SubjectImpl({
    void onListen(),
    Future onCancel(),
    bool sync: false,
  }) {
    return new SubjectImpl.publish(
      onListen: onListen,
      onCancel: onCancel,
      sync: sync
    );
  }

}