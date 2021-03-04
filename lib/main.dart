import 'package:flutter/material.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/home.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login": (context) => Login(),
      "/home": (context) => Home(),
    }
  ));
}
