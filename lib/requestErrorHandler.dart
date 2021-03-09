

import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class RequestErrorHandler {

  String errorHandler(String response, BuildContext context) {
    if (response != null) {
      //checks if there is an authentication error
      if (response != "Unauthorized") {
        //checks if there is a connection error
        if (response != "connection") {
          return response;

          //runs if there is a connection error
        } else if (response == "connection") {
          Toast.show("Feil med internett forbindelse", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          return null;
        }
        //runs if the user cannot be verified. Could be wrong login information, or the user does not have access to api call
      } else {
        Toast.show("Kunne ikke verifisere bruker", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        return null;
      }
      //runs if there is an error
    } else {
      Toast.show("En feil skjeddeawd", context, duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
      return null;
    }

    return null;
  }
}