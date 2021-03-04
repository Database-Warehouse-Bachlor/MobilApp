import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiClient {

  String baseURL = "http://10.0.2.2:5000/api/JWTAuthentication?orgNum=1234&pass=admin";

  Future<String> getClient(String customUrl, Map bodyInfo, String token) async {
    String mainUrl = baseURL + customUrl;

    //Creates a post request
    http.Response response = await http.post(baseURL,
        headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
        body: bodyInfo
    );

    if(response.statusCode == 200) {
      print(response.body.toString());
      return response.body.toString();
    } else {
      print("Noe gikk galt i post metoden");
      return null;
    }

  }
}
