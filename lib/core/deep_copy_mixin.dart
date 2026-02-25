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

/// A mixin that provides the capability to create deep copies of instances.
///
/// Classes that use this mixin must implement the `copy()` method, which
/// returns a new instance of the class with the same properties. This
/// ensures that any mutable fields are also deeply copied when necessary.
mixin DeepCopy<T> {
  /// Creates a deep copy of the current instance.
  T copy();
}
