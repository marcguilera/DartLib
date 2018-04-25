import 'dart:async';
import 'package:meta/meta.dart';
import 'history.dart';

typedef T DefaultValue<T>();

class ChangeStreamTransformer<T> extends StreamTransformerBase<T, IObservableChange<T>> {

  final DefaultValue<T> defaultValueGetter;

  ChangeStreamTransformer({this.defaultValueGetter});

  @override
  Stream<IObservableChange<T>> bind(Stream<T> stream) {
    return stream
        .transform(new HistoryStreamTransformer<T>(maxItems: 2))
        .map(_map);
  }

  IObservableChange<T> _map(List<T> items) {
    return new ObservableChange(
      previousValue: items.length > 1 ? items.first : _defaultValue(),
      currentValue: items.length > 0 ? items.last : _defaultValue()
    );
  }

  T _defaultValue() {
    return defaultValueGetter == null
        ? null
        : defaultValueGetter();
  }

}

abstract class IObservableChange<T> {
  T get previousValue;
  T get currentValue;
}

class ObservableChange<T> implements IObservableChange<T> {
  @override
  final T previousValue;
  @override
  final T currentValue;
  const ObservableChange({
    this.previousValue,
    @required this.currentValue
  });
}