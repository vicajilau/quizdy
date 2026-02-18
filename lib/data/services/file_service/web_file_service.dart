import 'dart:async';
import 'dart:convert';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:quiz_app/domain/models/quiz/quiz_file.dart';
import 'package:web/web.dart';

import 'package:quiz_app/data/services/file_service/i_file_service.dart';

/// The `FileService` class provides functionalities for managing `.quiz` files.
/// This includes reading, decoding, saving, and picking `.quiz` files across platforms.
class QuizFileService implements IFileService {
  /// Keep an original copy of the Quiz document in order to detect changes in the Quiz document.
  @override
  QuizFile? originalFile;

  /// Reads a `.quiz` file from the specified [filePath], retrieves its binary data,
  /// and decodes it into a `QuizFile` object.
  ///
  /// - [filePath]: The path or URL of the `.quiz` file.
  /// - Returns: A `QuizFile` object containing the parsed data from the file.
  /// - Throws: An exception if there is an error reading or decoding the file.
  @override
  @override
  Future<QuizFile> readQuizFile(String filePath) async {
    final quizFile = await readQuizFileContent(filePath);
    originalFile = quizFile.deepCopy();
    return quizFile;
  }

  /// Reads a `.quiz` file from the specified [filePath], retrieves its binary data,
  /// and decodes it into a `QuizFile` object.
  ///
  /// - [filePath]: The path or URL of the `.quiz` file.
  /// - Returns: A `QuizFile` object containing the parsed data from the file.
  /// - Throws: An exception if there is an error reading or decoding the file.
  @override
  Future<QuizFile> readQuizFileContent(String filePath) async {
    final codeUnits = await readBlobFile(filePath);
    final quizFile = decodeAndCreateQuizFile(filePath, codeUnits);
    return quizFile;
  }

  /// Decodes binary data [codeUnits] into a `QuizFile` object using the provided [filePath].
  ///
  /// - [filePath]: The path of the file being decoded.
  /// - [codeUnits]: The binary content of the file as `Uint8List`.
  /// - Returns: A `QuizFile` object containing the parsed data.
  QuizFile decodeAndCreateQuizFile(String? filePath, Uint8List codeUnits) {
    // Decode the binary data to a UTF-8 string
    final content = utf8.decode(codeUnits);

    // Convert the string content to a JSON Map and create a QuizFile object
    final json = jsonDecode(content) as Map<String, dynamic>;
    return QuizFile.fromJson(json, filePath: filePath);
  }

  /// Saves a `QuizFile` object to the file system by opening a save dialog.
  ///
  /// - [quizFile]: The `QuizFile` object to save.
  /// - [dialogTitle]: The title of the save dialog window.
  /// - Returns: The `QuizFile` object with an updated file path if the user selects a path.
  /// - Throws: An exception if there is an error saving the file.
  @override
  Future<QuizFile?> saveQuizFile(
    QuizFile quizFile,
    String dialogTitle,
    String fileName,
  ) async {
    String jsonString = jsonEncode(quizFile.toJson());
    final bytes = utf8.encode(jsonString);

    // Open a save dialog for the user to select a file path
    final pathSaved = await FilePicker.platform.saveFile(
      dialogTitle: dialogTitle,
      fileName: fileName,
      initialDirectory: quizFile.filePath,
      bytes: bytes,
    );

    if (pathSaved == null) return null;

    quizFile.filePath = pathSaved;
    originalFile = quizFile.deepCopy();
    return quizFile;
  }

  /// Opens a file picker dialog for the user to select a `.quiz` file.
  ///
  /// If a file is selected, it retrieves the file's binary data and decodes it into a `QuizFile` object.
  ///
  /// - Returns: A `QuizFile` object if a valid file is selected, or `null` if no file is selected.
  @override
  Future<QuizFile?> pickFile() async {
    final file = await pickFileContent();
    if (file != null) {
      originalFile = file.deepCopy();
    }
    return file;
  }

  /// Opens a file picker dialog for the user to select a `.quiz` file WITHOUT updating original file state.
  ///
  /// - Returns: A `QuizFile` object if a valid file is selected, or `null` if no file is selected.
  @override
  Future<QuizFile?> pickFileContent() async {
    // Open the file picker dialog
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['quiz'],
    );

    // If a file is selected, read and return the file as a QuizFile object
    if (result != null) {
      final bytes = result.files.single.bytes;
      if (bytes != null) {
        return decodeAndCreateQuizFile(result.files.single.path, bytes);
      }
    }
    return null; // Return null if no file is selected
  }

  /// Reads the binary data of a file from a Blob URL.
  ///
  /// This method fetches the file from the provided [blobUrl], processes it as a Blob,
  /// and reads its content as an `Uint8List`.
  ///
  /// - [blobUrl]: The URL of the file to read.
  /// - Returns: A `Uint8List` containing the binary content of the file.
  /// - Throws: An exception if there is an error fetching or reading the file.
  Future<Uint8List> readBlobFile(String blobUrl) async {
    try {
      // Fetch the Blob from the URL
      final response = await window.fetch(blobUrl.toJS).toDart;
      final blob = await response.blob().toDart;

      // Create a FileReader to read the Blob's content
      final reader = FileReader();
      final completer = Completer<Uint8List>();

      // Set up a listener for when the reading is complete
      reader.onLoadEnd.listen((event) {
        if (reader.error != null) {
          completer.completeError('Error reading the blob: ${reader.error}');
        } else {
          ByteBuffer? byteBuffer = (reader.result as JSArrayBuffer?)?.toDart;
          completer.complete(byteBuffer?.asUint8List());
        }
      });

      // Read the Blob as an ArrayBuffer
      reader.readAsArrayBuffer(blob);

      // Return the result as a Future<Uint8List>
      return await completer.future;
    } catch (e) {
      throw Exception('Error reading the file: $e');
    }
  }
}
