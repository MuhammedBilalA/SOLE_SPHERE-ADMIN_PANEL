import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductServices {
  Future<String> uploadImg(XFile image) async {
    try {
      final path = 'files/${image.name}';
      final file = File(image.path);
      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      return urlDownload;
    } catch (error) {
      return '';
    }
  }
}
