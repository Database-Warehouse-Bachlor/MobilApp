import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/userPrefs.dart';
import 'package:mobilapp/services/apiClient.dart';
import "package:mobilapp/requestErrorHandler.dart";
import 'package:shared_preferences/shared_preferences.dart';


class RegisterUser {

  static const registerUrl = "auth/initregister";

  Map registerInfo;
  bool errorCheck = false;
  ApiClient apiClient = new ApiClient();

  Future<bool> register(String username, String password, int tennantId, BuildContext context) async{

    registerInfo = {
      "email": "$username",
      "pwd": "$password",
      "tennantId": "$tennantId"
    };
    //Sends request create user
    Response response = await ApiClient().getClient(apiClient.baseURL + registerUrl, registerInfo, "");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (response == null){
      String errorMessage = preferences.getString("error");

      errorCheck = await RequestErrorHandler().errorHandler(errorMessage, context);
    }

    if(errorCheck) {
      return true;
    }
    return false;
  }

}