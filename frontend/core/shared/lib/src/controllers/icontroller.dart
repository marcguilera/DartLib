import 'package:rxdart/rxdart.dart';
import 'package:lib.frontend.core.shared/views.dart';

/// Represents a view controller AKA presenter AKA business logic component.
///
/// Rules:
/// 1) All inputs will instances of a [Subject].
/// 2) All the outputs will be instances of a [Observable].
/// 3) Do not pass instances of a [IView]. Interactions should be done through Streams!
/// 4) No flutter / web code is allowed in the BLoC (abstract).
///
/// If you follow these 3 rules build the BLoC as you want.
abstract class IController {

  /// Only non-sink function of a controller. Closes all its sinks.
  void closeSubjects();
}