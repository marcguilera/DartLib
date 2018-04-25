import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class IFirebaseAuth {
  Stream<FirebaseUser> get onAuthStateChanged;
  Future<FirebaseUser> signInWithEmail({@required String email, @required String password});
  Future<FirebaseUser> signUpWithEmail({@required String email, @required String password});
  Future<FirebaseUser> signInWithGoogle({@required String idToken, @required String accessToken});
  Future<FirebaseUser> signInWithFacebook({@required String accessToken});
  Future signOut();
}