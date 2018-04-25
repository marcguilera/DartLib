import 'dart:async';
import 'package:lib.core.di/di.dart';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:lib.frontend.mobile.auth/services.dart';

class GoogleCredentialsImpl extends CredentialsBaseImpl implements IGoogleCredentials {

  final IMobileAuth auth;

  GoogleCredentialsImpl(IInjector injector):
        auth = singletonNotNull(injector, IMobileAuth);

  @override
  Future<IAuthenticatedUser> authenticate() {
    return auth.signInWithGoogle();
  }

}
