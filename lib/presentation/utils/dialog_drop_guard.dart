// Copyright (C) 2026 Víctor Carreras
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
