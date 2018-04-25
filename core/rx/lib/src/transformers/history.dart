import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'dart:math';
import 'package:quiver/check.dart';

class HistoryStreamTransformer<T> extends StreamTransformerBase<T, List<T>> {
  final StreamTransformer<T, List<T>> transformer;

  HistoryStreamTransformer({
    int maxItems
  }): transformer = _buildTransformer(count: maxItems);

  @override
  Stream<List<T>> bind(Stream<T> stream) {
    return transformer.bind(stream);
  }

  static StreamTransformer<T, List<T>> _buildTransformer<T>({
      int count
  }) {
    checkArgument(count == null || count >= 0, message: () => 'count is negative');
    List<T> list = new List<T>();

    final handleData = (T data, EventSink output) {
      list.add(data);
      while(list.length > count) list.removeAt(0);
      final newList = new List<T>.unmodifiable(list);
      output.add(newList);
    };

    return new StreamTransformer.fromHandlers(handleData: handleData);
  }

}