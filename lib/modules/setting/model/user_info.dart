

import 'dart:convert';

class User {
  String? userEmail;
  String? password;

  User(this.userEmail, this.password);

  User.fromJson(dynamic json){
    userEmail = json['userEmail'];
    password = json['password'];
  }


}