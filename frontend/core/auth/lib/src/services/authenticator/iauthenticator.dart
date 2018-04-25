import 'dart:async';
import '../iauthenticated_user.dart';
import '../credentials/icredentials.dart';

/// The authority who takes care all authentication matters and holds a reference
/// to the current user.
abstract class IAuthenticator {

  /// The current user or null of there isn't any. Will always return the latest
  /// known user and provide updates after that.
  Stream<IAuthenticatedUser> get user;

  /// Authenticates the given credentials. Returns the [IAuthenticatedUser] user if
  /// successful.
  ///
  /// Anyone listening to [user] will be notified.
  Future<IAuthenticatedUser> authenticate(ICredentials credentials);

  /// Terminates the current session if any.
  ///
  /// Anyone listening to [user] will be notified.
  Future signOut();
}