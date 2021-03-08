import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiClient {

  String baseURL = "http://10.0.2.2:5000/api/JWTAuthentication?orgNum=1234&pass=admin";

  Future<String> getClient(String customUrl, Map bodyInfo, String token) async {
    String mainUrl = baseURL + customUrl;

    var jSONbody = jsonEncode(bodyInfo);

    print("sender response");

    try {

      //http.Response response = await http.post("http://10.0.2.2:5000/api/JWTAuthentication?orgNum=1234&pass=admin");

      //Creates a post request with a timeout after 10 seconds
      http.Response response = await http.post(customUrl,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jSONbody
      ).timeout(Duration(seconds: 10));

      print("gay");
      print(response.statusCode);

      //If everything is OK
      if (response.statusCode == 200) {
        String responseDecoded = jsonDecode(response.body).toString();
        return responseDecoded;

        //If user is not authorized
      } else if (response.statusCode == 401) {
        return "Unauthorized";
      }

      //If there is other internal issues
      return null;

      //If the app cannot connect to the api
    } on TimeoutException catch (e) {
      print(e);
      return "connection";
    }
    catch (e) {
      print(e);
      return null;
    }
  }
}
