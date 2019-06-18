import 'package:flutter/material.dart';
import 'package:villageapp/bloc/login_bloc.dart';
import 'package:villageapp/provider/AuthProvider.dart';
import 'package:villageapp/provider/BlocProvider.dart';
import 'package:villageapp/provider/FirestoreProvider.dart';
import 'package:villageapp/screen/custom/textFieldCustom.dart';
import 'package:villageapp/screen/home/home.dart';
import 'package:villageapp/screen/login/newUser.dart';


Widget signinPage(BuildContext context) {
  Color color=Colors.red[300];

AuthProvider authProvider;
  LoginBloc _bloc= BlocProvider.ofLogin(context);
  String _emailError;
  String _passwordError;

    final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _email;
  String _password;


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


      _emailController.addListener(_emailListen);
  _passwordController.addListener(_passwordListen);
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
            padding: EdgeInsets.all(120.0),
            child: Center(
              child: Icon(
                Icons.headset_mic,
                color: color,
                size: 50.0,
              ),
            ),
          ),
                   textFieldCustom(false,color, "EMAIL", _emailError, 'mail@live.fr', _emailController, context),

          Divider(
            height: 24.0,
          ),
             textFieldCustom(true,color, "MOT DE PASSE", _passwordError, '*********', _passwordController, context),

          Divider(
            height: 24.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: (){

 showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Réinitialiser le mot de passe"),
            content:  Text("EMAIL"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Envoyer"),
                onPressed: () {
                  if (_bloc.submitWithEmail(_emailController.text) != null) {
                    if (authProvider != null) {
                      authProvider.resetPasswordUser(_emailController.text);
                    }
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
 );



                  },
                ),
              ),
            ],
          ),
          new Container(
            width:MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: color,
                    onPressed: (){

_bloc
                    .submit(_emailController.text, _passwordController.text)
                    .then((userId) {
                

                Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(userId)),
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
                              "CONNEXION",
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

