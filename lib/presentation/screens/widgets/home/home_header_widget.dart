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

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeHeaderWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onSettingsTap;

  const HomeHeaderWidget({
    super.key,
    required this.isLoading,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: IconButton(
              icon: const Icon(LucideIcons.settings),
              color: Theme.of(context).iconTheme.color,
              iconSize: 24,
              onPressed: isLoading ? null : onSettingsTap,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
