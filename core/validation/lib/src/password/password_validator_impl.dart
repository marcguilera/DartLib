import 'ipassword_validator.dart';
import '../validator_base_impl.dart';

class PasswordValidatorImpl extends ValidatorBaseImpl<String> implements IPasswordValidator {
  @override
  bool isValid(String value) {
    return true;
  }

}