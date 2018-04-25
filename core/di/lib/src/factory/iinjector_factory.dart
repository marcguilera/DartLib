import 'package:lib.core.di/di.dart';
import 'environment.dart';

/// Helps setting up all the dependencies for a project.
abstract class IInjectorFactory {

  /// Creates an [IInjector] for a given [Environment] flavor.
  IInjector createInjector([Environment environment = Environment.production]);
}