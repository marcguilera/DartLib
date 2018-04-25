import 'package:lib.core.di/di.dart';
import 'app.dart';
import 'package:lib.frontend.mobile.routing/router.dart';
import 'package:meta/meta.dart';
import 'iapp_factory.dart';

abstract class AppFactoryBase implements IAppFactory {

  @protected
  IInjectorFactory get injectorFactory;

  @override
  App createApp([Environment environment = Environment.production]) {
    final injector = injectorFactory.createInjector(environment);
    final IRouteGenerator generator = injector.has(IRouteGenerator)
        ? injector.singleton(IRouteGenerator)
        : null;
    return doCreateApp(injector, generator);
  }

  @protected
  App doCreateApp(IInjector injector, IRouteGenerator generator);

}
