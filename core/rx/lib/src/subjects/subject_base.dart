import 'dart:async';
import 'package:rxdart/src/subjects/subject.dart';

abstract class SubjectBase<T> implements StreamController<T> {

  @override
  bool get isClosed => _subject.isClosed;

  @override
  bool get isPaused => _subject.isPaused;

  @override
  Future get done => _subject.done;

  @override
  bool get hasListener => _subject.hasListener;

  @override
  StreamSink<T> get sink => _subject.sink;

  @override
  Stream<T> get stream => _subject.stream;

  @override
  ControllerCancelCallback get onCancel => _subject.onCancel;

  @override
  ControllerCallback get onListen => _subject.onListen;

  @override
  ControllerCallback get onPause => _subject.onPause;

  @override
  ControllerCallback get onResume => _subject.onResume;

  final Subject<T> _subject;
  SubjectBase(this._subject);

  @override
  void add(T event) {
    _subject.add(event);
  }

  @override
  void addError(Object error, [StackTrace stackTrace]) {
    _subject.addError(error, stackTrace);
  }

  @override
  Future addStream(Stream<T> source, { bool cancelOnError: true }) {
    return _subject.addStream(source, cancelOnError: cancelOnError);
  }

  @override
  Future close() {
    return _subject.close();
  }

  @override
  set onCancel(dynamic Function() onCancelHandler) {
    _subject.onCancel = onCancelHandler;
  }

  @override
  set onListen(void Function() onListenHandler) {
    _subject.onListen = onListenHandler;
  }

  @override
  set onPause(void Function() onPauseHandler) {
    _subject.onPause = onPauseHandler;
  }

  @override
  set onResume(void Function() onResumeHandler) {
    _subject.onResume = onResumeHandler;
  }

}