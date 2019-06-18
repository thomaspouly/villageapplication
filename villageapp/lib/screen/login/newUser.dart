import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_page_form/multi_page_form.dart';
import 'package:villageapp/bloc/user_bloc.dart';
import 'package:villageapp/provider/BlocProvider.dart';
import 'package:villageapp/screen/custom/textFieldCustom.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:villageapp/screen/home/home.dart';


class NewUserPage extends StatefulWidget {

   String uid;

  NewUserPage(this.uid);

  @override
  _NewUserPageState createState() => new _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> with TickerProviderStateMixin {


Color color=Colors.red[300];
File _image;
UserBloc _bloc;
  String _nameError;
  String _firstNameError;

    final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();

  String _name;
  String _firstName;
  bool admin=false;

UserBloc ofUser(BuildContext context) {
  return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
      .userBloc;
}



void _nameListen() {
    if (_nameController.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameController.text;
    }
  }

  void _firstNameListen() {
    if (_firstNameController.text.isEmpty) {
      _firstName = "";
    } else {
      _firstName = _firstNameController.text;
    }
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
     if(image!=null){
    image = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    setState(() {
      _image = image;
    });
     }
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
 image = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    setState(() {
      _image = image;
    });
    }
   
  }
  Widget _buildImage() {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: _image == null
          ? new Column(children: <Widget>[
            Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: <Widget>[
                       FlatButton(
                   onPressed: () {
                  getImageFromCamera();
                },
                  child:CircleAvatar(
                          radius: 50.0,
                          backgroundColor:color,
                          child: Icon(
                            Icons.photo_camera,
                            size: 40,
                          ),
                        ),),
                        
                         FlatButton(
                  onPressed: () async {
                  getImageFromGallery();
                },
                  child: new CircleAvatar(
                          radius: 50.0,
                          backgroundColor:color,
                          child: Icon(
                            Icons.photo_library,
                            size: 40,
                          ),
                        ),
                         ),
                    ],
                  ),width: height,),
            ])
          : Column(children: <Widget>[

         
                      CircleAvatar(
                        radius: 100,
                        child: Image.file(_image),
                      ),
                      RaisedButton(
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        color: color,
                        child: Text("Changer"),
                        onPressed: (){
                          setState(() {
                            _image=null;
                          });
                        },
                      )
          ],)
          
            
    );
  }

  @override
  void initState() {
    super.initState();
  }
double height;
  @override
  Widget build(BuildContext context) {
    _bloc=BlocProvider.ofUser(context);

 height= MediaQuery.of(context).size.height;

      _nameController.addListener(_nameListen);
  _firstNameController.addListener(_firstNameListen);



    return SafeArea(
        child: Scaffold(
      body: MultiPageForm(
     /*   nextButtonStyle: ,
        previousButtonStyle: ,
        submitButtonStyle: ,
*/
        onFormSubmitted: () {

          _bloc.createUser(widget.uid, _name, _firstName, admin,  _image);
      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(widget.uid)),
                      );


        },
        pageList: <Widget>[page1(),page2(),page3(),page4()],
        totalPage: 4,
      ),
    ));
  }

Widget page1() {
      return Container(margin: EdgeInsets.only(top: height/3
      ),
        child: Column(children: <Widget>[
          Text("Quel est votre prenom ?",style: TextStyle(fontSize: height/40),),
          textFieldCustom(false, color, "", _nameError, "Thomas", _nameController, context)
        ],)
      );
    }
  
  Widget page2() {
      return Container(margin: EdgeInsets.only(top: height/3
      ),
        child: Column(children: <Widget>[
          Text("Quel est votre nom de famille ?",style: TextStyle(fontSize: height/40),),
          textFieldCustom(false, color, "", _firstNameError, "DUPOND", _firstNameController, context)
        ],)
      );
    }
    Widget page3() {
      return Container(margin: EdgeInsets.only(top: height/4
      ),
        child: Column(children: <Widget>[
          Text("Choississez une image",style: TextStyle(fontSize: height/40),),
          _buildImage()
          ],)
      );
    }

       Widget page4() {
      return Container(margin: EdgeInsets.only(top: height/3
      ),
        child: Column(children: <Widget>[
          Text("Je suis:",style: TextStyle(fontSize: height/40),), new FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: color,
                  onPressed: () {
           
                   
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
                            "un HABITANT",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: height/40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
          Text("ou:",style: TextStyle(fontSize: height/40),),
          new FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  color: color,
                  onPressed: () {
                  setState(() {
                    admin=true;
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
                            "un VILLAGE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: height/40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              
        ],)
      );
    }



}