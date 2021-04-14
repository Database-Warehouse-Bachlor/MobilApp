import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:mobilapp/numberOfTennantAndErrors.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    String tennantsAndErrors = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> numberMap = jsonDecode(tennantsAndErrors);
    var numberOgTennantsAndErrors = NumberOfTennantAndErrors.fromJson(numberMap);

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Home"),
        backgroundColor: Colors.orange[800],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
          ),
          child: new Center(
            child: new Column(
              children: [
                Row(
                  children: [
                    SizedBox(height: 130, width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        height: 100,
                        padding: EdgeInsets.fromLTRB(5, 5, 3, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),

                          color: Colors.grey[200],
                          onPressed: () {
                            Navigator.pushNamed(context, "/home/tennantListView");
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text(
                                "Antall brukere:",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                numberOgTennantsAndErrors.numberOfTennants.toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.center,
                              ),

                            ]

                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 130, width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        height: 100,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.grey[200],
                          onPressed: () {
                            Navigator.pushNamed(context, "/home/logListView");
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
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        height: 110,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.grey[200],
                          onPressed: () {
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Registrerte feil det siste døgnet:",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 6),
                              Text(
                                numberOgTennantsAndErrors.numberOfErrors.toString(),
                                style: TextStyle(
                                  fontSize: 30,
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
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            //Clears the token
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            preferences.setString("token", "");

                            //Goes back to the login screen
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