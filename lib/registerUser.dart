import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobilapp/services/apiClient.dart';
import "package:mobilapp/requestErrorHandler.dart";
import 'package:shared_preferences/shared_preferences.dart';


class RegisterUser {

  static const registerUrl = "auth/initregister";

  Map registerInfo;
  bool errorCheck = false;
  ApiClient apiClient = new ApiClient();

  /*
 *  Used to create the initial user for a tennant.
 *  username, password and tennantId is required as user input to be able to register a new user
 *  A tennant has to be registered in the database to be able to create a user
 */
  Future<bool> register(String username, String password, int tennantId, BuildContext context) async{

    registerInfo = {
      "email": "$username",
      "pwd": "$password",
      "tennantId": "$tennantId"
    };
    // Sends request to backend to create an initial user
    Response response = await ApiClient().getClient(apiClient.baseURL + registerUrl, registerInfo, "");
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // If there is an error with the http request
    if (response == null){
      String errorMessage = preferences.getString("error");

      // returns true if there is no error, returns false if there is an error
      errorCheck = await RequestErrorHandler().errorHandler(errorMessage, context);
    }

    if(errorCheck) {
      return true;
    }
    return false;
  }

}