/// Represents a credentials to authenticate with email
abstract class IEmailCredentials {
  /// The email address
  String get email;

  /// The password
  String get password;
}