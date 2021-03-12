import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

class Tennant_View extends StatefulWidget {
  @override
  _Tennant_ViewState createState() => _Tennant_ViewState();
}

class _Tennant_ViewState extends State<Tennant_View> {

  List data = [
    {
      "city": "Hamresanden",
      "address": "Juraveien 4",
      "zipcode": "4656",
      "tennant_id": "1",
      "business_id": "123456789",
      "tennant_name": "ElProffen"
    },
    {
      "city": "Laksevåg",
      "address": "Håsteins gate 10",
      "zipcode": "5160",
      "tennant_id": "2",
      "business_id": "123789456",
      "tennant_name": "Kamo Ent. AS"
    },
    {
      "city": "Ulsteinvik",
      "address": "Smårisevadet 19",
      "zipcode": "6065",
      "tennant_id": "4",
      "business_id": "321654897",
      "tennant_name": "Kuldepartner AS"
    }
  ];

  @override
  Widget build(BuildContext context) {

    print(data);

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: Text("Liste over tennants"),
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
                                "City",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(height: 6),
                              new Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(height: 6),
                              new Text(
                                "Zipcode",
                                style: TextStyle(
                                  fontSize: 20,
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