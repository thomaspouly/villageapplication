import 'dart:async';
import 'package:villageapp/model/User.dart';
import 'package:villageapp/provider/Repository.dart';

class LoginBloc {
  final _repository = new Repository();

  Future<String> submit(String email, String password) {
    if (validateFields(email, password)) {
      return _repository.authenticateUser(email, password);
    }
    return null;
  }

  Future<void> submitWithEmail(String email) {
    if (validateFieldsEmail(email)) {
      return _repository.resetPasswordEmail(email);
    }
    return null;
  }

  Future<User> getUserById(String id) {
    return _repository.getUserById(id);
  }



  bool validateFields(String email, String password) {
    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty &&
        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email) &&
        password.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  bool validateFieldsEmail(String email) {
    if (email != null &&
        email.isNotEmpty &&
        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }
}
