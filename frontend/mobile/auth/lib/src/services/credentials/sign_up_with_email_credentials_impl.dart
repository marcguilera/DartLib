import 'dart:async';
import 'package:lib.core.di/di.dart';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:meta/meta.dart';
import 'package:lib.frontend.mobile.auth/services.dart';

class SignUpWithEmailCredentialsImpl extends SignUpWithEmailCredentialsBaseImpl implements ISignUpWithEmailCredentials {
  final IMobileAuth auth;

  SignUpWithEmailCredentialsImpl(IInjector injector, {
    @required String email,
    @required String password,
    @required String passwordRepeat
  }) :  auth = singletonNotNull(injector, IMobileAuth),
        super(injector, email: email, password: password, passwordRepeat: passwordRepeat);


  @override
  Future<IAuthenticatedUser> authenticate() {
    return auth.signUpWithEmail(email: email, password: password);
  }

}
