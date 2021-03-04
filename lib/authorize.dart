import 'package:flutter/material.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/userPrefs.dart';
import 'package:mobilapp/services/apiClient.dart';

class Authorize {

  Map loginInfo;

  Future<String> authorize(String username, String password) async{
    print("hei");

    loginInfo = {
      "username": "$username",
      "password": "$password"
    };

    String response = await ApiClient().getClient("http://10.0.0.2:5000/api/JWTAuthentication?orgNum=1234&pass=admin", {}, "");

    if(response == null) {
      print("wow");
    }

    print("ayayaya");
    print(response.toString());

    return response;
  }



}