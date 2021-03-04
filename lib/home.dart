import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List data;

  Color color = Colors.green;

  String missingDataInfo = "Alle data er registrert som forventet!";


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Home"),
        backgroundColor: Colors.orange[800],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: new Center(
            child: new Column(
              children: [
                Row(
                  children: [
                    SizedBox(height: 130, width: 10),
                    Expanded(
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.fromLTRB(5, 5, 3, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.white,
                          onPressed: () {
                          },
                          child: Text(
                            "hei",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 130, width: 10),
                    Expanded(
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.white,
                          onPressed: () {
                          },
                          child: Text(
                            "Log",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100, width: 10),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(height: 130, width: 10),
                    Expanded(
                      child: Container(
                        height: 110,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.white,
                          onPressed: () {
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Manglende data",
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 6),
                              Text(
                                "wowowowow",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: color,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 130, width: 10),
                  ],
                ),

                Row(
                  children: [
                    SizedBox(height: 100, width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          child: Text(
                            "LogOut",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}