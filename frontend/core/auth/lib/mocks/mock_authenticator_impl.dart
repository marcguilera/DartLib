import 'dart:async';
import 'package:lib.frontend.core.auth/services.dart';

class MockAuthenticatorImpl extends AuthenticatorBaseImpl {

  Future onSignOut;
  Stream<IAuthenticatedUser> onUser;

  MockAuthenticatorImpl({
    this.onSignOut,
    this.onUser
  }) {
    onSignOut ??=  Future.value(null);
    onUser ??=  Stream.empty();
  }

  @override
  Future signOut() =>  onSignOut;

  @override
  Stream<IAuthenticatedUser> get user => onUser;

}