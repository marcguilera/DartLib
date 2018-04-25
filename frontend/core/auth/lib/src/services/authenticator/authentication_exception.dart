import 'iauthenticator.dart';

/// Represents an exception in the authentication process.
///
/// see: [IAuthenticator]
abstract class AuthenticationException implements Exception {
  factory AuthenticationException([dynamic message]) =>  Exception(message);
}
