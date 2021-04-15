
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

import '../errorLog.dart';

class LogView extends StatefulWidget {
  @override
  _LogViewState createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {


  List data = [
    {
      "errorMessage": "Newtonsoft.Json.JsonSerializationException : Error converting value to type 'System.Int64'. Path 'InvoiceInbound[1].supplierId', line 20, position 29. businessId: 123123123",
      "date": "2008-03-09T16:05:07",
      "errorType": "GAY"
    },
    {
      "errorMessage": "Enda en feil skjedde",
      "date": "2008-03-09T16:05:07",
      "errorType": "IHJAJAJJJAHDFAEOFHA"
    }
  ];


  @override
  Widget build(BuildContext context) {

    List<ErrorLog> errorLog = List<ErrorLog>.from(data.map((model)=> ErrorLog.fromJson(model)));


    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: Text("Liste over feil"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[400]),
        child: new ListView.builder(
          itemCount: errorLog == null ? 0 : data.length,
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
                                "${DateFormat('dd-MM-yyyy - KK:mm').format(errorLog[index].date)}",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
                              new Text(
                                "${errorLog[index].errorType}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              new Text(
                                "${errorLog[index].errorMessage}",
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
