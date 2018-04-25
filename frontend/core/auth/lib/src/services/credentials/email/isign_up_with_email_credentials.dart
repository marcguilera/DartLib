import 'iemail_credentials.dart';

/// Represents a credentials to sign up with email.
abstract class ISignUpWithEmailCredentials implements IEmailCredentials {
  /// The repeated password.
  String get passwordRepeat;
}