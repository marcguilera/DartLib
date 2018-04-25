import 'package:lazy/lazy.dart';
import 'package:meta/meta.dart';
import 'irouter_factory.dart';
import 'router_builder.dart';

abstract class RouterFactoryBase implements IRouterFactory {
  final _builderLazy =  Lazy(() =>  RouterBuilder());

  @protected
  RouterBuilder get builder => _builderLazy();

}