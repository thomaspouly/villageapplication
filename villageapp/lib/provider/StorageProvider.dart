import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageProvider {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> setImage(String userId, File image) async {
    _firebaseStorage.ref().child('/image/' + userId).putFile(image);
  }

  Future<String> getUrlImage(String uid) async {
    final ref = FirebaseStorage.instance.ref().child("image/" + uid);
    String url = await ref.getDownloadURL();
    return url;
  }
}
