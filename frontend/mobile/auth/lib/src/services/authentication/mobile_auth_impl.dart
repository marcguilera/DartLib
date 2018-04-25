import 'dart:async';
import 'package:lib.frontend.core.auth/services.dart';
import 'package:meta/meta.dart';
import 'imobile_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiver/check.dart';
import 'package:lib.core.di/di.dart';
import 'ifirebase_auth.dart';
import 'igoogle_auth.dart';
import 'ifacebook_auth.dart';
import 'package:rxdart/subjects.dart';

class MobileAuthImpl implements IMobileAuth {

  final IFirebaseAuth _firebase;
  final IGoogleAuth _google;
  final IFacebookAuth _facebook;
  final BehaviorSubject<IAuthenticatedUser> _user =  BehaviorSubject<IAuthenticatedUser>(seedValue: null);

  MobileAuthImpl(IInjector injector):
      _firebase = singletonNotNull(injector, IFacebookAuth),
      _google = singletonNotNull(injector, IGoogleAuth),
      _facebook = singletonNotNull(injector, IFacebookAuth) {
    _user.addStream(_firebase.onAuthStateChanged.map(_maybeCreateUser));
  }

  @override
  Stream<IAuthenticatedUser> get user => _user.stream;

  @override
  Future<IAuthenticatedUser> signInWithEmail({@required String email, @required String password}) async {
    final user = await _firebase.signUpWithEmail(email: email, password: password);
    return _maybeCreateUser(user);
  }

  @override
  Future<IAuthenticatedUser> signUpWithEmail({String email, String password}) async {
    final user = await _firebase.signUpWithEmail(email: email, password: password);
    return _maybeCreateUser(user);
  }

  @override
  Future<IAuthenticatedUser> signInWithFacebook() {
    return  Future.error('not implemented');
  }

  @override
  Future<IAuthenticatedUser> signInWithGoogle() async {
    final googleUser = (await _google.signInSilently()) ?? (await _google.signIn());
    final googleAuth = await googleUser.authentication;
    final user = await _firebase.signInWithGoogle(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    return _maybeCreateUser(user);
  }

  @override
  Future signOut() {
    return _firebase.signOut();
  }

  IAuthenticatedUser _maybeCreateUser(FirebaseUser user) {
    return user == null ? null :  _FirebaseUser(user);
  }

  void close() {
    _user.close();
  }

}


class _FirebaseUser implements IAuthenticatedUser {
  final FirebaseUser firebaseUser;

  _FirebaseUser(this.firebaseUser) {
    checkNotNull(firebaseUser, message: () => 'firebaseUser is null');
  }

  @override
  String get id => firebaseUser.uid;

  @override
  String get name => firebaseUser.displayName;

  @override
  String get email => firebaseUser.email;
}