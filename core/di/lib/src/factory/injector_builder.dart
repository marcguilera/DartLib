import '../injector/iinjector.dart';
import '../injector/injector_impl.dart';
import 'package:lazy/lazy.dart';
import 'package:quiver/check.dart';

class InjectorBuilder {
  final _injectorLazy = Lazy(() => InjectorImpl());
  InjectorImpl get _injector => _injectorLazy();

  InjectorBuilder bind<T>(Type type, Factory<T> factory) {
    checkNotNull(type, message: () => 'type is null');
    checkNotNull(factory, message: () => 'factory is null');
    _injector.register(type, factory);
    return this;
  }

  InjectorBuilder alias<T>(Type aliasType, Type targetType) {
    checkNotNull(aliasType, message: () => 'aliasType is null');
    checkNotNull(targetType, message: () => 'targetType is null');
    _injector.register(aliasType, (injector) => _injector.create(targetType)); 
    return this;
  }

  InjectorBuilder bindMany<T>(List<Type> types, Factory<T> factory) {
    checkArgument(types != null && types.isNotEmpty, message: () => 'types is null or empty');
    final targetType = types.first;
    bind(targetType, factory);
    for (var i = 1 ; i < types.length ; i++) {
      alias(types[i], targetType);
    }
    return this;
  }

  IInjector build() {
    return _injector;
  }
}
