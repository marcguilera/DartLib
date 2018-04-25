import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

abstract class IGoogleAuth {
  Future<GoogleSignInAccount> signInSilently();
  Future<GoogleSignInAccount> signIn();
}
