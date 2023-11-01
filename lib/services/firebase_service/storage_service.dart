import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;

sealed class StoreService {
  static final storage = FirebaseStorage.instance;

  static Future<String> uploadFile( File file) async {
    try {
      /// storage
      final image = storage.ref("Images menu").child("image_${DateTime.now().toIso8601String()}${file.path.substring(file.path.lastIndexOf("."))}" );
      final task = image.putFile(file);
      await task.whenComplete(() {});
      return image.getDownloadURL();
    } catch(e) {
      debugPrint("ERROR DB: $e");
      return "";
    }
  }

  static Future<void> removeFiles(String imagePath) async {
      var fileUrl = Uri.decodeFull(path.basename(imagePath)).replaceAll(RegExp(r'(\?alt).*'), '');
      final storeReference = storage.ref().child(fileUrl);
      await storeReference.delete();
    }
  }

