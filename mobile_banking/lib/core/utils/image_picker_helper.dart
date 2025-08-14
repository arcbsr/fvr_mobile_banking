import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  /// Pick image(s) from camera or gallery.
  /// Returns list of [File] objects (empty if user cancels).
  static Future<List<File>> pickImages(BuildContext context, {bool onlyCamera = false}) async {
    // Ask the user: Camera or Gallery?
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.purple),
              title: const Text("Take Photo"),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            if (!onlyCamera)
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.purple),
                title: const Text("Choose from Gallery"),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
          ],
        ),
      ),
    );

    if (source == null) return [];

    // If gallery → allow multiple
    if (source == ImageSource.gallery) {
      final pickedFiles = await _picker.pickMultiImage(imageQuality: 80);
      return pickedFiles.map((file) => File(file.path)).toList();
    } else {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      return pickedFile != null ? [File(pickedFile.path)] : [];
    }
  }
}

/*

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  /// Pick image(s) from camera or gallery.
  /// Returns list of file paths (can be empty if user cancels).
  static Future<List<String>> pickImages(BuildContext context, {bool onlyCamera = false}) async {
    // Ask the user: Camera or Gallery?
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [

            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.purple),
              title: const Text("Take Photo"),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            if(!onlyCamera)
            ListTile(
              leading: const Icon(Icons.photo, color: Colors.purple),
              title: const Text("Choose from Gallery"),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source == null) return [];

    // If gallery → allow multiple
    if (source == ImageSource.gallery) {
      final pickedFiles = await _picker.pickMultiImage(imageQuality: 80);
      return pickedFiles.map((file) => file.path).toList();
    } else {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      return pickedFile != null ? [pickedFile.path] : [];
    }
  }
}

*/
