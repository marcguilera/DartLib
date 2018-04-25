import 'iauth_controller.dart';
import 'package:rxdart/subjects.dart';
import 'package:lib.core.di/di.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class AuthControllerBase implements IAuthController {

  String currentEmail, currentPassword;

  final PublishSubject<String> onEmail =  PublishSubject<String>();
  final PublishSubject<String> onPassword =  PublishSubject<String>();
  final PublishSubject onSubmit =  PublishSubject();

  AuthControllerBase(IInjector injector) {
    onEmail.observable.distinct().listen(handleOnEmail);
    onPassword.observable.distinct().listen(handleOnPassword);
    onSubmit.observable.listen((_) => handleOnSubmit());
  }

  void handleOnEmail(String email) {
    currentEmail = email;
  }

  void handleOnPassword(String password) {
    currentPassword = password;
  }

  void handleOnSubmit();

  @override
  @mustCallSuper
  void closeSinks() {
    onEmail.close();
    onPassword.close();
    onSubmit.close();
  }

}