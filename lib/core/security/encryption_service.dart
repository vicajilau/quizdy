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

import 'dart:convert';
import 'package:crypto/crypto.dart';

class EncryptionService {
  static const String _salt = 'QuizApp2025Salt';

  /// Genera una clave de encriptación basada en un identificador del dispositivo
  static String _generateKey() {
    // Usar un identificador simple pero consistente
    const deviceId = 'quiz_app_device_2025';
    var bytes = utf8.encode(deviceId + _salt);
    var digest = sha256.convert(bytes);
    return digest.toString().substring(0, 32);
  }

  /// Encripta un texto usando XOR con la clave generada
  static String encrypt(String plainText) {
    if (plainText.isEmpty) return '';

    final key = _generateKey();
    final keyBytes = utf8.encode(key);
    final textBytes = utf8.encode(plainText);

    final encrypted = <int>[];
    for (int i = 0; i < textBytes.length; i++) {
      encrypted.add(textBytes[i] ^ keyBytes[i % keyBytes.length]);
    }

    // Convertir a base64 para almacenar como string
    return base64.encode(encrypted);
  }

  /// Desencripta un texto encriptado
  static String decrypt(String encryptedText) {
    if (encryptedText.isEmpty) return '';

    try {
      final key = _generateKey();
      final keyBytes = utf8.encode(key);
      final encryptedBytes = base64.decode(encryptedText);

      final decrypted = <int>[];
      for (int i = 0; i < encryptedBytes.length; i++) {
        decrypted.add(encryptedBytes[i] ^ keyBytes[i % keyBytes.length]);
      }

      return utf8.decode(decrypted);
    } catch (e) {
      // Si falla la desencriptación, retornar string vacío
      return '';
    }
  }

  /// Verifica si un texto está encriptado (formato base64 válido)
  static bool isEncrypted(String text) {
    try {
      base64.decode(text);
      return true;
    } catch (e) {
      return false;
    }
  }
}
