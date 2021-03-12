import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:mobilapp/services/apiClient.dart';
import 'package:mobilapp/tennant.dart';
import 'package:mobilapp/errorLog.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  final String tennantInfo = "https://api.mocki.io/v1/897d1d9b";
  final String logInfo = "https://api.mocki.io/v1/73055422";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<void> getJsonData() async {

    Response response = await ApiClient().getClient(tennantInfo, {}, "");

    Iterable reponseDecoded = jsonDecode(response.body);
    List<Tennant> tennants = List<Tennant>.from(reponseDecoded.map((model)=> Tennant.fromJson(model)));

    response = await ApiClient().getClient(logInfo, {}, "");

    reponseDecoded = jsonDecode(response.body);
    List<ErrorLog> errorLog = List<ErrorLog>.from(reponseDecoded.map((model)=> ErrorLog.fromJson(model)));

    print(tennants[0].tennantName);
    print(errorLog[0].log);

    //Navigator.pushReplacementNamed(context, "/home", arguments: tennants);

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.orange[800],
          size: 80.0,
        ),
      ),
    );
  }
}