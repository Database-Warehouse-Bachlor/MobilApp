import 'package:flutter/material.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/userPrefs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobilapp/services/apiClient.dart';

class Authorize {

  Map loginInfo;

  Future<String> authorize(String username, String password) async{
    print("hei");

    loginInfo = {
      "username": "$username",
      "password": "$password"
    };








    UserPrefs().token.write(key: "token", value: "5556");

    Future<String> re = UserPrefs().token.read(key: "token");

    print(re.toString());

    String response = await ApiClient().getClient("JWTAuthentication?orgNum=1234&pass=admin");
  }





}