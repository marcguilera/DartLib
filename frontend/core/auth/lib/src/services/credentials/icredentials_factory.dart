import 'package:meta/meta.dart';
import 'package:lib.frontend.core.auth/services.dart';

/// A factory that creates different types of [ICredentials] so that
/// they can be consumed by a [IAuthenticator].
abstract class ICredentialsFactory {

  /// Creates a [ISignInWithEmailCredentials].
  ISignInWithEmailCredentials createSignInWithEmailCredentials({
    @required String email,
    @required String password
  });

  /// Creates a [ISignUpWithEmailCredentials].
  ISignUpWithEmailCredentials createSignUpWithEmailCredentials({
    @required String email,
    @required String password,
    @required String passwordRepeat
  });

  /// Creates a [IGoogleCredentials].
  IGoogleCredentials createGoogleCredentials();

  /// Creates a [IFacebookCredentials].
  IFacebookCredentials createFacebookCredentials();

}
