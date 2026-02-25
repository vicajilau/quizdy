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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension SnackbarExtension on BuildContext {
  /// Displays a snack bar with the given text message.
  ///
  /// This method uses the `ScaffoldMessenger` to show a `SnackBar`
  /// containing the provided `text`. The `BuildContext` must be valid
  /// within the widget tree.
  ///
  /// - Parameters:
  ///   - text: The message to display in the `SnackBar`.
  ///
  /// Example usage:
  /// ```dart
  /// context.presentSnackBar("File uploaded successfully!");
  /// ```
  void presentSnackBar(String text) {
    showGeneralDialog(
      context: this,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      barrierColor: Colors.black12,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return _AutoDismissDialog(text: text);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}

extension NavigationExtension on BuildContext {
  /// Returns the current route location from GoRouter.
  String get currentRoute {
    return GoRouter.of(
      this,
    ).routerDelegate.currentConfiguration.matches.last.matchedLocation;
  }
}

class _AutoDismissDialog extends StatefulWidget {
  final String text;

  const _AutoDismissDialog({required this.text});

  @override
  State<_AutoDismissDialog> createState() => _AutoDismissDialogState();
}

class _AutoDismissDialogState extends State<_AutoDismissDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
