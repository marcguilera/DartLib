import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lazy/lazy.dart';
import 'ifirebase_auth.dart';

class FirebaseAuthImpl implements IFirebaseAuth {
  final Lazy<FirebaseAuth> _lazy =  Lazy<FirebaseAuth>(() => FirebaseAuth.instance);
  FirebaseAuth get firebase => _lazy();

  @override
  Stream<FirebaseUser> get onAuthStateChanged => firebase.onAuthStateChanged;

  @override
  Future<FirebaseUser> signInWithEmail({String email, String password}) {
    return firebase.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<FirebaseUser> signUpWithEmail({String email, String password}) {
    return firebase.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<FirebaseUser> signInWithFacebook({String accessToken}) {
    return firebase.signInWithFacebook(accessToken: accessToken);
  }

  @override
  Future<FirebaseUser> signInWithGoogle({String idToken, String accessToken}) {
    return firebase.signInWithGoogle(idToken: idToken, accessToken: accessToken);
  }

  @override
  Future signOut() {
    return firebase.signOut();
  }
}