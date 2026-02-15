import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/utils/dialog_drop_guard.dart';

/// A drop zone wrapper for use inside dialogs.
///
/// Wraps a child widget with [DropTarget] and manages [DialogDropGuard]
/// to prevent screen-level DropTargets from processing the same event.
///
/// [onFilesDropped] is called with the dropped file details.
/// [onDragStateChanged] notifies when the drag-over state changes (for visual feedback).
class DialogDropZone extends StatefulWidget {
  final Widget child;
  final void Function(DropDoneDetails details) onFilesDropped;
  final ValueChanged<bool>? onDragStateChanged;

  const DialogDropZone({
    super.key,
    required this.child,
    required this.onFilesDropped,
    this.onDragStateChanged,
  });

  @override
  State<DialogDropZone> createState() => _DialogDropZoneState();
}

class _DialogDropZoneState extends State<DialogDropZone> {
  @override
  void initState() {
    super.initState();
    // Block global drag & drop while this dialog is open
    DialogDropGuard.activate();
  }

  @override
  void dispose() {
    DialogDropGuard.deactivate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragEntered: (_) {
        widget.onDragStateChanged?.call(true);
      },
      onDragExited: (_) {
        widget.onDragStateChanged?.call(false);
      },
      onDragDone: (details) {
        widget.onDragStateChanged?.call(false);

        if (details.files.isNotEmpty) {
          widget.onFilesDropped(details);
        }
      },
      child: widget.child,
    );
  }
}
