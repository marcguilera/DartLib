import 'ivalidator.dart';

abstract class ValidatorBaseImpl<T> implements IValidator<T> {
  bool isInvalid(T value) {
    return !isValid(value);
  }
}