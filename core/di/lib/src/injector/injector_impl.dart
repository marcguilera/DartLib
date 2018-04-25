import 'package:lib.core.di/di.dart';
import 'package:dioc/dioc.dart';
import 'package:lib.core.shared/disposable.dart';
import 'package:lazy/lazy.dart';

/// Describes how to create instances of a type.
typedef T Factory<T>(IInjector injector);

/// An implementation of a [IInjector] using a [Container] as the data store.
class InjectorImpl implements IInjector, IDisposable {

  final Lazy<Container> _container =  Lazy<Container>(() =>  Container());
  Container get container => _container();

  @override
  T create<T>(Type type) {
    return container.create(type) as T;
  }

  @override
  T singleton<T>(Type type) {
    return container.singleton(type) as T;
  }

  /// Registers an object [Factory] for a type.
  void register<T>(Type type, Factory<T> factory) {
    container.register(type, (_) => factory(this));
  }

  /// Deletes the [Factory] for the type.
  void unregister(Type type) {
    container.unregister(type);
  }

  /// Checks if the container has a [Factory] for a given type.
  @override
  bool has(Type type) {
    return container.has(type);
  }

  @override
  void dispose() {
    container.reset();
  }

}
