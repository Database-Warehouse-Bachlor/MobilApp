
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../errorLog.dart';

class LogView extends StatefulWidget {
  @override
  _LogViewState createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {


  List<ErrorLog> errorData;


  @override
  Widget build(BuildContext context) {
    errorData = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: Text("Liste over feil"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.brown[100]),
        child: new ListView.builder(
          itemCount: errorData == null ? 0 : errorData.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: new Center(
                child: new Column(
                  children: [
                    SizedBox(height: 6),
                    new Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: new Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Text(
                                "${DateFormat('dd-MM-yyyy - KK:mm').format(errorData[index].date)}",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
                               new Text(
                                 "${errorData[index].errorType}",
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                              new Text(
                                "${errorData[index].errorMessage}",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
