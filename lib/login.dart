import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilapp/main.dart';

import "package:mobilapp/services/apiClient.dart";
import 'package:mobilapp/userPrefs.dart';
import 'package:mobilapp/authorize.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/4_3_logo_tekst.png',
                height: 130,
                width: 230),
              SizedBox(height: 20),
              Text('Cordel Norge AS', style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey[700]
              ),
              ),
              SizedBox(height: 40.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Brukernavn',
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrange
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Passord',
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrange
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.all(25.0),
                child: SizedBox(width: 200.0,
                  child: RaisedButton(onPressed: () async {

                    bool loginSuccessful = await Authorize().authorize("1234", "admin", context);

                    //If everything is ok, sends to home page
                    if(loginSuccessful) {
                      Navigator.pushReplacementNamed(context, "/home");
                    }

                  },
                    padding: new EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Text('Log inn ',
                        style: TextStyle(fontSize: 24.0,
                          color: Colors.grey[900],
                        )
                    ),
                    color: Colors.orange[800],

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}