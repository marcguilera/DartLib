import '../iauth_controller.dart';

abstract class ISignUpController extends IAuthController {
  Sink<String> get passwordRepeat;
}