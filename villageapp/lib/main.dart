import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:villageapp/screen/login/login.dart';
import 'provider/BlocProvider.dart';

void main() {
 ThemeData theme=new ThemeData.light();


    runApp(MaterialApp(
      home: new BlocProvider(
              child:  new MaterialApp(
                      title: 'Flutter Demo',
                      theme: theme,
                      home: new SplashScreen(
                          seconds: 2,
                          navigateAfterSeconds: new LoginPage(),
                          title: new Text(
                            'Vill\'app',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.brown,
                                wordSpacing: 3),
                          ),
                          image: null,
                          styleTextUnderTheLoader: new TextStyle(),
                          photoSize: 100.0,
                          loaderColor: Colors.blue),
                    )
                  )
         
    ));
}
