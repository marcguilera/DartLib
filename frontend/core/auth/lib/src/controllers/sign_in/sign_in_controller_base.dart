import 'package:lib.core.di/src/injector/iinjector.dart';
import 'isign_in_controller.dart';
import '../auth_controller_base.dart';

abstract class SignInControllerBase extends AuthControllerBase implements ISignInController {
  SignInControllerBase(IInjector injector) : super(injector);

}