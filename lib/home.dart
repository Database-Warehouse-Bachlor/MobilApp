import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mobilapp/homeInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;

  Color color;

  String errorLogText;

  String endPointChanger = "";

  String missingDataInfo = "Alle data er registrert som forventet!";

  @override
  Widget build(BuildContext context) {
    String tennantsAndErrors = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> numberMap = jsonDecode(tennantsAndErrors);
    var homeInfo = HomeInfo.fromJson(numberMap);

    if (homeInfo.numberOfErrors > 0) {
      color = Colors.red;
      errorLogText = homeInfo.numberOfErrors.toString();
    } else {
      color = Colors.green;
      errorLogText = "Ingen registrerte feil.";
    }

    return new Scaffold(
      appBar: new AppBar(
        title: Text(""),
        backgroundColor: Colors.orange[800],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.brown[100]),
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
                            borderRadius: BorderRadius.circular(5)),
                        height: 100,
                        padding: EdgeInsets.fromLTRB(5, 5, 3, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.grey[200],
                          onPressed: () {
                            endPointChanger = "tennants";
                            Navigator.pushNamed(context, "/loading", arguments: endPointChanger);
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Antall brukere:",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  homeInfo.numberOfTennants.toString(),
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
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
                            borderRadius: BorderRadius.circular(5)),
                        height: 100,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.grey[200],
                          onPressed: () {
                            endPointChanger = "logList";
                            Navigator.pushNamed(context, "/loading", arguments: endPointChanger);
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
                    SizedBox(width: 10),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(height: 85, width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        height: 110,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.grey[200],
                          onPressed: () {
                            endPointChanger = "logErrorLastTwentyFour";
                            Navigator.pushNamed(context, "/loading", arguments: endPointChanger);
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
                                errorLogText,
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
                    SizedBox(height: 85 ,width: 10),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(height: 85, width: 10),
                    Expanded(child: Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                          borderRadius: BorderRadius.circular(5)),
                          child: FlatButton(
                            onPressed: ()  {
                              //Goes to the register screen
                              Navigator.pushNamed(context, "/register");
                            },
                            child: Text(
                              "Ny bruker",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                          ),
                      ),
                    ),
                    ),
                    SizedBox(height: 85, width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: FlatButton(
                          onPressed: () async {
                            //Clears the token
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
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
                    SizedBox(height: 6, width: 10),
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
