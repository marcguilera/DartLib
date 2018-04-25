import 'package:lib.frontend.core.shared/controllers.dart';

/// Represents a view that will be rendered in the user's screen.
///
/// Rules:
/// 1) The view is the only place where there should be Flutter / Web logic.
/// 2) No business logic in the [IView], that belongs to the [IController]
/// 3) Each view complex enough must have its [IController].
abstract class IView {

}