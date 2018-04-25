import 'dart:async';
import 'package:lib.frontend.core.auth/auth.dart';

class MockCredentialsImpl implements ISignUpWithEmailCredentials, ISignInWithEmailCredentials, IGoogleCredentials, IFacebookCredentials {

  Future<IAuthenticatedUser> onAuthenticate;
  Future<bool> onIsValid;

  String email;
  String password;
  String passwordRepeat;

  MockCredentialsImpl({
    this.onAuthenticate,
    this.onIsValid,
    this.email,
    this.password,
    this.passwordRepeat
  }) {
    email ??= 'email@gmail.com';
    password ??= 'password1234';
    passwordRepeat ??= password;
    onAuthenticate ??=  Future.error('not implemented');
    onIsValid ??=  Future.value(true);
  }

  @override
  Future<IAuthenticatedUser> authenticate() =>  onAuthenticate;

  @override
  Future<bool> get isValid => onIsValid;

}