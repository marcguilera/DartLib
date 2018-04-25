/// Helps validating a value.
abstract class IValidator<T> {

  /// Returns true if the value is valid, false otherwise.
  bool isValid(T value);

  /// Returns true if the value is invalid, false otherwise.
  bool isInvalid(T value);
}