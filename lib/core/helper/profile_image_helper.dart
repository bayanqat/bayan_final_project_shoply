import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import '../utils/images/app_images.dart';

class ProfileImageHelper {
  static final Map<String, Uint8List> _decodedImages = {};

  /// profileImage can be empty, a data URI saved in Firestore, or a network URL
  static ImageProvider provider(String profileImage) {
    if (profileImage.isEmpty) {
      return AssetImage(AppImages.profilePicture);
    }
    if (profileImage.startsWith('data:image')) {
      // Decode once and reuse the same bytes, so the picture doesn't flicker on rebuild
      final bytes = _decodedImages.putIfAbsent(
        profileImage,
        () => base64Decode(profileImage.substring(profileImage.indexOf(',') + 1)),
      );
      return MemoryImage(bytes);
    }
    return CachedNetworkImageProvider(profileImage);
  }
}
