import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String  id;
  String name;
  String firstname;
  bool admin;

  User({this.name, this.firstname,this.id, this.admin});


  User.fromMap(Map<String, dynamic> map, {this.id})
      :   assert(map['name'] != null),
        assert(map['firstname'] != null),
        assert(map['admin'] != null),
        
       
        name = map['name'],
        firstname = map['firstname'],
        admin = map['admin'];


  Map<String, dynamic> toJson() => {
        
        'name': name,
        'firstname': firstname,
        'admin': admin,
        
      };

  @override
  String toString() => "User<ID:$id:Name:$name:Firstname:$firstname:Admin:$admin>";


}
