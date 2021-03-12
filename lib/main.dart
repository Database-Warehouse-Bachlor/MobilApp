import 'package:flutter/material.dart';
import 'package:mobilapp/View/logVeiw.dart';
import 'package:mobilapp/loadingscreen.dart';
import 'package:mobilapp/login.dart';
import 'package:mobilapp/home.dart';
import 'file:///G:/Skole/Bachlor_oppgave/mobilapp/lib/View/tennantListView.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/login": (context) => Login(),
      "/loading": (context) => Loading(),
      "/home": (context) => Home(),
      "/home/tennantListView": (context) => Tennant_View(),
      "/home/logListView": (context) => LogView()
    }
  ));
}
