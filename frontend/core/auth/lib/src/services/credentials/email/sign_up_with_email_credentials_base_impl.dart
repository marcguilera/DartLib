import 'dart:async';
import 'package:lib.core.di/di.dart';
import 'package:meta/meta.dart';
import 'email_credentials_base_impl.dart';
import 'isign_up_with_email_credentials.dart';

abstract class SignUpWithEmailCredentialsBaseImpl extends EmailCredentialsBaseImpl implements ISignUpWithEmailCredentials {
  final String passwordRepeat;

  SignUpWithEmailCredentialsBaseImpl(IInjector injector, {
    @required String email,
    @required String password,
    this.passwordRepeat
  }): super (
      injector,
      email: email,
      password: password
  );

  @override
  Future<bool> get isValid async {
    final valid = await super.isValid;
    return valid && password == passwordRepeat;
  }

  @override
  String toString() {
    final map = { 'email' : email, 'password': password, 'passwordRepeat': passwordRepeat };
    return map.toString();
  }

}