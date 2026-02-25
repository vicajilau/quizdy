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

class DeepCollectionEquality {
  /// Compares two lists deeply.
  static bool listEquals<T>(List<T>? list1, List<T>? list2) {
    if (identical(list1, list2)) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }
    for (int i = 0; i < list1.length; i++) {
      if (!DeepCollectionEquality.equals(list1[i], list2[i])) {
        return false;
      }
    }
    return true;
  }

  /// Compares two maps deeply.
  static bool mapEquals<K, V>(Map<K, V>? map1, Map<K, V>? map2) {
    if (identical(map1, map2)) return true;
    if (map1 == null || map2 == null || map1.length != map2.length) {
      return false;
    }
    for (final key in map1.keys) {
      if (!map2.containsKey(key) ||
          !DeepCollectionEquality.equals(map1[key], map2[key])) {
        return false;
      }
    }
    return true;
  }

  /// General equality check that supports deep comparison for lists, maps, and objects.
  static bool equals(dynamic obj1, dynamic obj2) {
    if (identical(obj1, obj2)) return true;

    if (obj1 is List && obj2 is List) {
      return listEquals(obj1, obj2);
    }

    if (obj1 is Map && obj2 is Map) {
      return mapEquals(obj1, obj2);
    }

    return obj1 == obj2;
  }
}
