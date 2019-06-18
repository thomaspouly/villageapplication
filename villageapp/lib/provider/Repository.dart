import 'dart:io';
import 'package:villageapp/model/User.dart';
import 'package:villageapp/provider/AuthProvider.dart';
import 'package:villageapp/provider/FirestoreProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();
  final authProvider = AuthProvider();

  Future<String> authenticateUser(String email, String password) =>
      authProvider.authenticateUser(email, password);

  Future<String> registerUser(String email, String password) {

     return authProvider.registerUser(
          email, password);

          }

    

  Future<void> resetPasswordEmail(String email) =>
      authProvider.resetPasswordUser(email);

  Future<String> getCurrentUser() => authProvider.currentUser();

  Future<User> getUserById(String id) {
    return _firestoreProvider.getUserById(id);
  }

      Future<String> createUser(String userId, String name,
          String firstname, bool admin, File image) {

      _firestoreProvider.createUser(
        userId,  name, firstname, admin,  image);

          }

    Future<User> modifyUser(String id, String email, String name,String firstname,bool admin, bool family) {
    return _firestoreProvider.modifyUser( id,  email,  name, firstname, admin,  family);
  }

}
