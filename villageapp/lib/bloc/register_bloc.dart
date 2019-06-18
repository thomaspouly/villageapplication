import 'dart:async';
import 'dart:io';
import 'package:villageapp/provider/Repository.dart';

class RegisterBloc {
  final _repository = Repository();

  Future<String> registerUser(String email, String password) {
    if (validateFields(email, password)) {
      
      return _repository.registerUser(
          email, password);
    } else {
      return null;
    }
  }

  bool validateFields(String email, String password) {
    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty &&
        email.contains('@') &&
        password.length > 4) {
      return true;
    } else {
      return false;
    }
  }
}
