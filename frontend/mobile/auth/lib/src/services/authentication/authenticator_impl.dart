import 'dart:async';

import 'package:lib.frontend.core.auth/services.dart';
import 'imobile_auth.dart';
import 'package:lib.core.di/di.dart';

class AuthenticatorImpl extends AuthenticatorBaseImpl {

  IMobileAuth auth;

  AuthenticatorImpl(IInjector injector):
        auth = singletonNotNull(injector, IMobileAuth);


  @override
  Stream<IAuthenticatedUser> get user => auth.user;

  @override
  Future signOut() {
    return auth.signOut();
  }

}