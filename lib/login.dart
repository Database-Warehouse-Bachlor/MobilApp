import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              Image.asset('assets/Cordel.png',
                  scale: 4),
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
                  labelText: 'Organization number',
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
                  labelText: 'Password',
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
                  child: RaisedButton(onPressed: () {
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