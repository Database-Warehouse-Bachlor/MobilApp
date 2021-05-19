import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobilapp/services/apiClient.dart';
import "package:mobilapp/requestErrorHandler.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Authorize {

  static const authURL = "auth/login";

  Map loginInfo;
  bool errorCheck = true;
  ApiClient apiClient = new ApiClient();

  Future<bool> authorize(String username, String password, BuildContext context) async{

    // information to be sent to the backend as the body of the request
    loginInfo = {
      "email": "$username",
      "pwd": "$password"
    };

    // Sends request to backend for password
    Response response = await ApiClient().getClient(apiClient.baseURL + authURL, loginInfo, "");
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // If there is an error with the http request
    if(response == null) {
      String errorMessage = preferences.getString("error");

      // returns true if there is no error, returns false if there is an error
      errorCheck = await RequestErrorHandler().errorHandler(errorMessage, context);
    }

    // if there is no error, it will update the token
    if(errorCheck) {
      preferences.setString("token", response.toString());
      return true;
    }
    return false;
  }

}