import 'dart:async';
import 'package:lib.core.di/di.dart';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:meta/meta.dart';
import 'package:lib.frontend.mobile.auth/services.dart';

class SignInWithEmailCredentialsImpl extends SignInWithEmailCredentialsBaseImpl implements ISignInWithEmailCredentials {
  final IMobileAuth auth;

  SignInWithEmailCredentialsImpl(IInjector injector, {
    @required String email,
    @required String password,
  }) :  auth = singletonNotNull(injector, IMobileAuth),
        super(injector, email: email, password: password);


  @override
  Future<IAuthenticatedUser> authenticate() {
    return auth.signInWithEmail(email: email, password: password);
  }

}
