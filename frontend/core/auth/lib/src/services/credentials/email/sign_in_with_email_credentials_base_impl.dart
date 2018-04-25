import 'package:lib.core.di/di.dart';
import 'package:meta/meta.dart';
import 'email_credentials_base_impl.dart';
import 'isign_in_with_email_credentials.dart';

abstract class SignInWithEmailCredentialsBaseImpl extends EmailCredentialsBaseImpl implements ISignInWithEmailCredentials {

  SignInWithEmailCredentialsBaseImpl(IInjector injector, {
    @required String email,
    @required String password,
  }): super (
    injector,
    email: email,
    password: password
  );
}