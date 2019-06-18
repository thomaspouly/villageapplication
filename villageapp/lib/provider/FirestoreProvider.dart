import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:villageapp/model/User.dart';
import 'package:villageapp/provider/AuthProvider.dart';
import 'package:villageapp/provider/StorageProvider.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;
  AuthProvider auth = AuthProvider();
  StorageProvider storage = StorageProvider();

  Future<User> getUserById(String userID) {
    return _firestore
        .collection('user')
        .document(userID)
        .get()
        .then((documentSnapshot) {
      User u = new User(
          name: documentSnapshot.data['name'],
          firstname: documentSnapshot.data['firstname'],
          admin: documentSnapshot.data['admin'],
          id: null);
      return u;
    });
  }

  String createUser(String userId,
      String name,String firstname, bool admin, File image) {
   
      storage.setImage(userId, image);
      User user = new User(
          id: null,
          name: name,
          firstname: firstname,
          admin: admin
          );
      _firestore.collection('user').document(userId).setData(user.toJson());
      return userId;
   
  }


  Future<User> modifyUser(String id, String email, String name,String firstname,bool admin, bool family) {
    return auth.currentUser().then((userID) {
      User user = new User(
          id:id,
          name: name,
          firstname: firstname,
          admin: admin,       
         );
      _firestore.collection('user').document(userID).updateData(user.toJson());
      return user;
    });
  }


}
