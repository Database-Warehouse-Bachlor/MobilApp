import 'package:flutter/material.dart';
import 'package:mobilapp/login.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/login",
    routes: {"/login": (context) => Login(),
    }
  ));
}