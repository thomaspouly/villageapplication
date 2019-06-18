import 'dart:io';

import 'package:flutter/material.dart';
import 'package:villageapp/bloc/register_bloc.dart';
import 'package:villageapp/provider/BlocProvider.dart';
import 'package:villageapp/screen/custom/textFieldCustom.dart';
import 'newUser.dart';

RegisterBloc ofRegi(BuildContext context) {
  return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
      .registerBloc;
}

Widget signupPage(BuildContext context) {
  Color color = Colors.red[300];

  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordController2 = new TextEditingController();
  RegisterBloc _bloc = BlocProvider.ofRegister(context);

  String _email = "";
  String _password = "";
  String _password2 = "";

  String _emailError = null;
    String _passwordError = null;
  String _passwordError2 = null;
  void _emailListen() {
    if (_emailController.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailController.text;
    }
  }

  void _passwordListen() {
    if (_passwordController.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordController.text;
    }
  }

  void _passwordListen2() {
    if (_passwordController2.text.isEmpty) {
      _password2 = "";
    } else {
      _password2 = _passwordController2.text;
    }
  }

  _emailController.addListener(_emailListen);
  _passwordController.addListener(_passwordListen);
  _passwordController2.addListener(_passwordListen2);

  return new Scaffold(
      body: Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.05), BlendMode.dstATop),
        image: AssetImage('assets/images/eglise.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: new Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(100.0),
          child: Center(
            child: Icon(
              Icons.headset_mic,
              color: color,
              size: 50.0,
            ),
          ),
        ),
textFieldCustom(false,color, "EMAIL", _emailError, "mail@live.fr", _emailController, context),

        Divider(
          height: 24.0,
        ),
        textFieldCustom(true,color, "MOT DE PASSE", _passwordError, '*********', _passwordController, context),

        Divider(
          height: 24.0,
        ),

          textFieldCustom(true,color, "CONFIRMER LE MOT DE PASSE", _passwordError2, '*********', _passwordController2, context),
       
        Divider(
          height: 24.0,
        ),
        new Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
          alignment: Alignment.center,
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: color,
                  onPressed: () {
                  
 _bloc.registerUser(_email, _password).then((onValue) {
                    print("ID:" + onValue);
                      String id = onValue;

                      
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => NewUserPage(onValue)),
                      );
                    });

                  
                   
                  },
                  child: new Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: Text(
                            "INSCRIPTION",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ));
}
