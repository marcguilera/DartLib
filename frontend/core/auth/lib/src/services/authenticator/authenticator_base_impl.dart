import 'dart:async';
import 'iauthenticator.dart';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:quiver/check.dart';
import 'authentication_exception.dart';

abstract class AuthenticatorBaseImpl implements IAuthenticator {

  @override
  Future<IAuthenticatedUser> authenticate(ICredentials credentials) async {
    checkNotNull(credentials, message: () => 'credentials is null');

    final isValid = await credentials.isValid;

    if (!isValid) {
      throw  AuthenticationException('Authentication failed with invalid credentials: $credentials.');
    }

    try {
      return await credentials.authenticate();
    } catch (e) {
      throw  AuthenticationException('Authentication failed with exception: $e.');
    }

  }

}
