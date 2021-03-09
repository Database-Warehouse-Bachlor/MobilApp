import 'package:flutter/material.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/userPrefs.dart';
import 'package:mobilapp/services/apiClient.dart';
import "package:mobilapp/requestErrorHandler.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Authorize {

  static const URL = "http://10.0.2.2:5000/api/login";
  Map loginInfo;

  Future<bool> authorize(String username, String password, BuildContext context) async{

    loginInfo = {
      "email": "$username",
      "pass": "$password"
    };

    String response = await ApiClient().getClient(URL, loginInfo, "");

    //returns response if there is no error
    String errorCheck = RequestErrorHandler().errorHandler(response, context);

    //if there is no error, it will update the token
    if(errorCheck != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", response);
      return true;
    }

    return false;
  }

}