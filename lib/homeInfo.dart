
import 'dart:convert';

import 'package:mobilapp/home.dart';

HomeInfo numberOfTennantAndErrors( String str) => HomeInfo.fromJson(json.decode(str));

class HomeInfo {
  HomeInfo({this.numberOfTennants, this.numberOfErrors});

  int numberOfTennants;
  int numberOfErrors;

  factory HomeInfo.fromJson(Map<String, dynamic> json) => HomeInfo(
    numberOfTennants: json["numberOfTennants"],
    numberOfErrors: json["numberOfErrors"]
  );


}