import 'dart:async';
import 'icredentials.dart';

/// The base implementation for all [ICredentials]
abstract class CredentialsBaseImpl implements ICredentials {
  @override
  Future<bool> get isValid =>  Future.value(true);
}