import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStoreStorage {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadImageAndGetUrl(
      String imagePath, String folderName) async {
    try {
      final Reference ref = _storage
          .ref()
          .child(folderName)
          .child(DateTime.now().millisecondsSinceEpoch.toString());
      final UploadTask uploadTask = ref.putFile(File(imagePath));
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return e.toString();
    }
  }
}
