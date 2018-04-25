import 'iemail_validator.dart';
import '../validator_base_impl.dart';
import 'package:validator/validator.dart';

class EmailValidatorImpl extends ValidatorBaseImpl<String> implements IEmailValidator {
  @override
  bool isValid(String value) {
    return isEmail(value);
  }

}