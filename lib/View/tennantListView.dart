import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:mobilapp/tennant.dart';

class Tennant_View extends StatefulWidget {
  @override
  _Tennant_ViewState createState() => _Tennant_ViewState();
}

class _Tennant_ViewState extends State<Tennant_View> {
  List<Tennant> data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: Text("Liste over tennants"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[400]),
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
                                data[index].tennantName,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  new Text(
                                    "Id: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index].id.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  new Text(
                                    "Orgnummer: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index].businessId,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  new Text(
                                    "API-nøkkel: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index].apiKey,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
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
