/// Coordinates drag & drop events between dialog-level and screen-level DropTargets.
///
/// When a dialog with its own drop zone is open and actively receiving a drag event,
/// screen-level DropTargets should check [isActive] and skip processing to prevent conflicts.
class DialogDropGuard {
  DialogDropGuard._();

  /// Whether a dialog drop zone is currently receiving a drag event.
  static bool isActive = false;

  /// Called by dialog DropTargets when drag enters.
  static void activate() => isActive = true;

  /// Called by dialog DropTargets when drag exits or drag is done.
  static void deactivate() => isActive = false;
}
