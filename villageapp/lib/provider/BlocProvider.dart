import 'package:flutter/material.dart';
import 'package:villageapp/bloc/login_bloc.dart';
import 'package:villageapp/bloc/user_bloc.dart';
import 'package:villageapp/bloc/register_bloc.dart';

class BlocProvider extends InheritedWidget {
  final loginBloc = LoginBloc();
  final registerBloc = RegisterBloc();
  final userBloc = UserBloc();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static LoginBloc ofLogin(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .loginBloc;
  }

  static RegisterBloc ofRegister(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .registerBloc;
  }

  static UserBloc ofUser(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .userBloc;
  }
}
