import 'dart:async';
import 'package:lib.core.di/di.dart';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:lib.frontend.mobile.auth/services.dart';

class FacebookCredentialsImpl extends CredentialsBaseImpl implements IFacebookCredentials {

  final IMobileAuth auth;

  FacebookCredentialsImpl(IInjector injector):
        auth = singletonNotNull(injector, IMobileAuth);

  @override
  Future<IAuthenticatedUser> authenticate() {
    return auth.signInWithFacebook();
  }

}
