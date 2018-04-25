import 'package:lib.core.di/di.dart';
import 'package:meta/meta.dart';
import 'package:lazy/lazy.dart';
import 'injector_builder.dart';
import 'iinjector_factory.dart';

abstract class InjectorFactoryBase implements IInjectorFactory {

  final _builderLazy = new Lazy(() => new InjectorBuilder());
  
  @protected
  InjectorBuilder get builder => _builderLazy();

  @override
  IInjector createInjector([Environment environment = Environment.production]) {
    print('Creating injector for envirnoment: $environment');

    switch (environment) {
      case Environment.production:
        return createProductionInjector();
      case Environment.test:
        return createTestInjector();
      case Environment.development:
        return createDevelopmentInjector();
      default:
        throw new StateError('Environment is invalid');
    }
  }

  @protected
  IInjector createProductionInjector();

  @protected
  IInjector createDevelopmentInjector() {
    return createProductionInjector();
  }

  @protected
  IInjector createTestInjector() {
    return createProductionInjector();
  }

}