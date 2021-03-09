import 'package:flutter/material.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/home.dart';
import 'package:mobilapp/tennantListView.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/login": (context) => Login(),
      "/home": (context) => Home(),
      "/home/tennantView": (context) => Tennant_View(),
    }
  ));
}
