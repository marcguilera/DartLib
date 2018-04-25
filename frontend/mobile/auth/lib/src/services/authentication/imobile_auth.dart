import 'dart:async';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:meta/meta.dart';

/// Acts as a proxy to access all the libs that help with authentication
abstract class IMobileAuth {

  /// Gets an updated copy of the current user (or null if none)
  Stream<IAuthenticatedUser> get user;

  /// Signs the user in with email and password
  Future<IAuthenticatedUser> signInWithEmail({@required String email, @required String password});

  /// Signs the user up with email and password
  Future<IAuthenticatedUser> signUpWithEmail({@required String email, @required String password});

  /// Shows the google dialog
  Future<IAuthenticatedUser> signInWithGoogle();

  /// Shows the facebook dialog
  Future<IAuthenticatedUser> signInWithFacebook();

  /// Finishes the current session if any
  Future signOut();
}