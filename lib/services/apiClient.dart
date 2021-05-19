import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/*
 *  A Class to contact the backend used in this project. baseURL is the mainpath, with customURL as endpoint.
 */
class ApiClient {

  String baseURL = "http://10.0.2.2:5000/";

  // Sends a request to the baseurl with the added endpoints
  Future<http.Response> getClient(String customUrl, Map bodyInfo, String token) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      //Creates a post request with a timeout after 10 seconds
      http.Response response = await http.post(customUrl,
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        body: bodyInfo,
        encoding: Encoding.getByName("utf-8")
      ).timeout(Duration(seconds: 10));

      //If everything is OK
      if (response.statusCode == 200) {

        return response;

        //If user is not authorized
      } else if (response.statusCode == 401) {
        print(response.statusCode);
        preferences.setString("error", "Unauthorized");
      }
      preferences.setString("error", "Error");

      //If there is other internal issues
      return null;

      //If the app cannot connect to the api
    } on TimeoutException catch (e) {
      preferences.setString("error", "Connection");
      return null;
    }
    catch (e) {
      preferences.setString("error", "Error");
      return null;
    }
  }
}
