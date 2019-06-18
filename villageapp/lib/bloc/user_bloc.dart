import 'dart:async';
import 'dart:io';
import 'package:villageapp/model/User.dart';
import 'package:villageapp/provider/Repository.dart';

class UserBloc {
  final _repository = Repository();

  Future<User> getUserById(String id) {
    return _repository.getUserById(id);
  }
  Future<String> getCurrentUser(String id) {
    return _repository.getCurrentUser();
  }
  Future<String> createUser(String userId,String name,
          String firstname, bool admin,  File image) {
    return _repository.createUser( userId, name, firstname, admin,  image);
  }

  Future<User> modifyUser(String id, String email, String name,String firstname,bool admin, bool family) {
    return _repository.modifyUser( id,  email,  name, firstname, admin,  family);
  }

}
