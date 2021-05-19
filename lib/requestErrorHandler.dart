import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class RequestErrorHandler {

  Future<bool> errorHandler(String errorMessage, BuildContext context) async {

    if (errorMessage != "Error") {
      //checks if there is an authentication error
      if (errorMessage != "Unauthorized") {
        //checks if there is a connection error
        if (errorMessage != "connection") {
          FocusManager.instance.primaryFocus.unfocus();
          return true;

          //runs if there is a connection error
        } else if (errorMessage == "connection") {
          FocusManager.instance.primaryFocus.unfocus();
          Toast.show("Feil med internett forbindelse", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        }
        //runs if the user cannot be verified. Could be wrong login information, or the user does not have access to api call
      } else if(errorMessage == "Unauthorized") {
        FocusManager.instance.primaryFocus.unfocus();
        Toast.show("Kunne ikke verifisere bruker", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
      //runs if there is an error
    } else {
      FocusManager.instance.primaryFocus.unfocus();
      Toast.show("En feil skjedde", context, duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
    }

    return false;
  }
}