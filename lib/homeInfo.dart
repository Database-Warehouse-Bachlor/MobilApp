
import 'dart:convert';

HomeInfo numberOfTennantAndErrors( String str) => HomeInfo.fromJson(json.decode(str));

class HomeInfo {
  HomeInfo({this.numberOfTennants, this.numberOfErrors});

  int numberOfTennants;
  int numberOfErrors;

  // Converts a JSON object to a Map list
  factory HomeInfo.fromJson(Map<String, dynamic> json) => HomeInfo(
    numberOfTennants: json["numberOfTennants"],
    numberOfErrors: json["numberOfErrors"]
  );


}