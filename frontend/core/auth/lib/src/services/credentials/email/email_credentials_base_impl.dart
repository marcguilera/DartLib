import 'dart:async';
import 'package:lib.core.di/di.dart';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:meta/meta.dart';
import 'package:lib.core.validation/validation.dart';
import 'iemail_credentials.dart';

abstract class EmailCredentialsBaseImpl extends CredentialsBaseImpl implements IEmailCredentials {
  final IEmailValidator emailValidator;
  final IPasswordValidator passwordValidator;
  final String email;
  final String password;

  EmailCredentialsBaseImpl(IInjector injector, {
    @required this.email,
    @required this.password
  }) : emailValidator = singletonNotNull(injector, IEmailValidator),
       passwordValidator = singletonNotNull(injector, IPasswordValidator);
  
  @override
  @mustCallSuper
  Future<bool> get isValid async {
    return emailValidator.isValid(email) && passwordValidator.isValid(password);
  }

  @override
  String toString() {
    final map = { 'email' : email, 'password': password };
    return map.toString();
  }


}