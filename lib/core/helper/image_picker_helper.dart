import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final _picker = ImagePicker();

  /// Small JPEG so it fits in a Firestore document (see UploadImageService)
  static Future<XFile?> pickImageGallery() async {
    final pickImage = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400,
      imageQuality: 70,
    );
    return pickImage;
  }
}
