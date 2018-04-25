import 'package:lib.frontend.core.auth/services.dart';
import 'package:lib.core.di/di.dart';
import 'package:meta/meta.dart';
import 'package:quiver/check.dart';
import 'facebook_credentials_impl.dart';
import 'google_credentials_impl.dart';
import 'sign_in_with_email_credentials_impl.dart';
import 'sign_up_with_email_credentials_impl.dart';

class CredentialsFactoryImpl implements ICredentialsFactory {
  final IInjector injector;

  CredentialsFactoryImpl(this.injector) {
    checkNotNull(injector, message: () => 'injector is null');
  }

  @override
  IFacebookCredentials createFacebookCredentials() {
    return  FacebookCredentialsImpl(injector);
  }

  @override
  IGoogleCredentials createGoogleCredentials() {
    return  GoogleCredentialsImpl(injector);
  }

  @override
  ISignInWithEmailCredentials createSignInWithEmailCredentials({@required String email, @required String password}) {
    return  SignInWithEmailCredentialsImpl(injector, email: email, password: password);
  }

  @override
  ISignUpWithEmailCredentials createSignUpWithEmailCredentials({@required String email, @required String password, @required String passwordRepeat}) {
    return  SignUpWithEmailCredentialsImpl(injector, email: email, password: password, passwordRepeat: passwordRepeat);
  }

}