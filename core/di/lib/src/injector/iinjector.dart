/// Represents a dependency injection container.
abstract class IInjector {

  /// Creates an instance of an object every time.
  T create<T>(Type type);

  /// Creates an instance of the object and returns the same instance every time after.
  T singleton<T>(Type type);

  bool has(Type type);

}
