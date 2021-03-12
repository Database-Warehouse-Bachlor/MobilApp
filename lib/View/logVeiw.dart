
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

class LogView extends StatefulWidget {
  @override
  _LogViewState createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {


  List data = [
    {
      "log": "Det skjedde noe feil her og her",
      "date": "2008-03-09T16:05:07",
      "tennant_id": "1",
      "tennantName": "bademiljøet"
    },
    {
      "log": "Enda en feil skjedde",
      "date": "2008-03-09T16:05:07",
      "tennant_id": "2",
      "tennantName": "Elproffen"
    }
  ];


  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: Text("Liste over feil"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[400]),
        child: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: new Center(
                child: new Column(
                  children: [
                    SizedBox(height: 5),
                    new Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: new Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Text(
                                "Navnet på bedriften",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              new Text(
                                "Orgnummeret",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(height: 6),
                              new Text(
                                "Feilmelding",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(height: 6),
                              new Text(
                                "Tidspunkt",
                                style: TextStyle(
                                    fontSize: 20
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
