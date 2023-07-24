import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class FileUtils {
  static Future<Uint8List> readFileAsBytes(XFile xFile) async {
    return await xFile.readAsBytes();
  }

  static Future<String> encodeFileToBase64(XFile xFile) async {
    final bytes = await readFileAsBytes(xFile);
    return base64Encode(bytes);
  }
}
