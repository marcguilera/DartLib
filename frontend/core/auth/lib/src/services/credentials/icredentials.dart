import 'dart:async';

import 'package:lib.frontend.core.auth/src/services/iauthenticated_user.dart';

/// Represents an authentication credentials
///
/// see: [IAuthenticator]
abstract class ICredentials {

  /// Checks whether this credentials are potentially valid without making the
  /// actual backend call.
  Future<bool> get isValid;

  /// Calls the backend to authenticate using this credentials.
  ///
  /// Returns a [IAuthenticatedUser] user if the authentication process succeeded.
  Future<IAuthenticatedUser> authenticate();
}