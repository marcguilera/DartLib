import 'authenticator/iauthenticator.dart';

/// Represents a user that has been authenticated.
///
/// see: [IAuthenticator]
abstract class IAuthenticatedUser {
  /// The identifier
  String get id;

  /// The display name
  String get name;

  /// The email address
  String get email;

}