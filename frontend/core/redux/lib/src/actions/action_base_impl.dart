import 'iaction.dart';

abstract class ActionBase<TPayload> implements IAction<TPayload> {
  final TPayload payload;

  ActionBase([this.payload]);

  @override
  String toString() {
    return '[$runtimeType] ($payload)';
  }

}