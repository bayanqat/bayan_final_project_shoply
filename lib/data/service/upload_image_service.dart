import 'dart:convert';
import 'dart:developer';
import 'dart:io';

class UploadImageService {
  /// Firestore allows 1 MB per document; keep the photo well under that
  static const int _maxImageBytes = 700 * 1024;

  /// The Spark plan has no Firebase Storage, so the photo is saved inside the user
  /// document as a data URI. ImagePickerHelper already shrinks it to 400 px.
  static Future<String?> uplaodImage({required File imageFile}) async {
    try {
      final bytes = await imageFile.readAsBytes();
      if (bytes.length > _maxImageBytes) {
        log('Image too large for Firestore: ${bytes.length} bytes');
        return null;
      }
      return 'data:image/jpeg;base64,${base64Encode(bytes)}';
    } on FileSystemException catch (e) {
      log('FileSystemException: ${e.message}');
      return null;
    }
  }
}
