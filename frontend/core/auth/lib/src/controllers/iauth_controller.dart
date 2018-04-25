
import 'package:lib.frontend.core.shared/controllers.dart';
import 'package:rxdart/rxdart.dart';

/// Represents a controller who handles the authentication
abstract class IAuthController extends IController {

  /// The current user or null
  Observable<bool> get isAuthenticated;

  /// The email state
  Observable<String> get email;

  /// The password state
  Observable<String> get password;

  /// Whether there is an error in the email
  Observable<bool> get isEmailError;

  /// Whether there is an error in the password
  Observable<bool> get isPasswordError;

  /// Whether there is an error in the password
  Observable<bool> get isBusy;

  /// The email address entered by the user
  Sink<String> get onEmail;

  /// The password entered by the user
  Sink<String> get onPassword;

  /// User has submitted
  Sink get onSubmit;
}