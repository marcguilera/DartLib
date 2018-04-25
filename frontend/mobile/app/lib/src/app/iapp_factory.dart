import 'app.dart';
import 'package:lib.core.di/di.dart';

abstract class IAppFactory {
  App createApp([Environment environment = Environment.production]);
}
