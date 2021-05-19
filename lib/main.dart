import 'package:flutter/material.dart';
import 'package:mobilapp/View/logVeiw.dart';
import 'package:mobilapp/loadingscreen.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/home.dart';
import 'package:mobilapp/View/tennantListView.dart';
import 'package:mobilapp/register.dart';


// Different routes used for the application
void main() {
  runApp(MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login": (context) => Login(),
      "/loading": (context) => Loading(),
      "/register": (context) => Register(),
      "/home": (context) => Home(),
      "/home/tennantListView": (context) => Tennant_View(),
      "/home/logListView": (context) => LogView()
    }
  ));
}
