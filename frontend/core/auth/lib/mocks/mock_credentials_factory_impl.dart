import 'dart:async';

import 'package:lib.frontend.core.auth/services.dart';
import 'mock_credentials_impl.dart';

class MockCredentialsFactoryImpl implements ICredentialsFactory {

  final Future<IAuthenticatedUser> onAuthenticate;
  final Future<bool> onIsValid;

  final String email;
  final String password;
  final String passwordRepeat;

  MockCredentialsFactoryImpl({
    this.onAuthenticate,
    this.onIsValid,
    this.email,
    this.password,
    this.passwordRepeat
  });

  @override
  IFacebookCredentials createFacebookCredentials() {
    return _createCredentials();
  }

  @override
  IGoogleCredentials createGoogleCredentials() {
    return _createCredentials();
  }

  @override
  ISignInWithEmailCredentials createSignInWithEmailCredentials({String email, String password}) {
    return _createCredentials();
  }

  @override
  ISignUpWithEmailCredentials createSignUpWithEmailCredentials({String email, String password, String passwordRepeat}) {
    return _createCredentials();
  }

  MockCredentialsImpl _createCredentials() {
    return  MockCredentialsImpl(email: email, password: password, passwordRepeat: passwordRepeat, onAuthenticate: onAuthenticate, onIsValid: onIsValid);
  }
}
