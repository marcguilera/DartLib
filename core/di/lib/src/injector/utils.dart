import 'iinjector.dart';
import 'package:quiver/check.dart';

T singletonNotNull<T>(IInjector injector, Type type) {
  checkNotNull(injector, message: () => 'injector is null');
  checkNotNull(type, message: () => 'type is null');
  final singleton = injector.singleton<T>(type);
  return singleton;
}

T createNotNull<T>(IInjector injector, Type type) {
  checkNotNull(injector, message: () => 'injector is null');
  checkNotNull(type, message: () => 'type is null');
  final instance = injector.create<T>(type);
  return instance;
}