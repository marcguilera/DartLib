import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'igoogle_auth.dart';
import 'package:lazy/lazy.dart';

class GoogleAuthImpl implements IGoogleAuth {

  final Lazy<GoogleSignIn> _lazy =  Lazy<GoogleSignIn>(() =>  GoogleSignIn());
  GoogleSignIn get google => _lazy();

  @override
  Future<GoogleSignInAccount> signIn() {
    return google.signIn();
  }

  @override
  Future<GoogleSignInAccount> signInSilently() {
    return google.signInSilently();
  }

}