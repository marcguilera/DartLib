/// Represents a Redux action that can be dispatched
abstract class IAction<TPayload> {
  /// The optional payload (may be null)
  TPayload get payload;
}