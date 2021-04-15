import 'dart:convert';
import 'dart:core';
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

  //final String tennantInfo = "https://api.mocki.io/v1/897d1d9b";
  final String logInfo = "https://api.mocki.io/v1/73055422";
  final String homeInfo = "homeinfo";
  final String tennantInfo = "tennants";

  ApiClient apiClient = new ApiClient();
  List data;

  String recievedHomeInfo;


  @override
  void initState() {
    super.initState();
   // this.getJsonData();
    this.getNumberOfTennantsAndErrors();
    //this.getTennantData();
  }

  Future<void> getNumberOfTennantsAndErrors() async {

    Response response = await ApiClient().getClient(apiClient.newBaseURL + homeInfo, {}, "");

    recievedHomeInfo = jsonDecode(response.body);
    print("Dafuq is dis " + recievedHomeInfo);

    Navigator.pushReplacementNamed(context, "/home", arguments: recievedHomeInfo);
  }

  Future<void> getTennantData() async {
    Response response = await ApiClient().getClient(apiClient.newBaseURL + tennantInfo, {}, "");

    Iterable responseDecode = jsonDecode(response.body);
    List<Tennant> tennants = List<Tennant>.from(responseDecode.map((model)=> Tennant.fromJson(model)));

    Navigator.pushReplacementNamed(context, "/home/tennantListView", arguments: tennants);
  }



  Future<void> getJsonData() async {

    Response response = await ApiClient().getClient(apiClient.newBaseURL + tennantInfo, {}, "");

    Iterable reponseDecoded = jsonDecode(response.body);
    List<Tennant> tennants = List<Tennant>.from(reponseDecoded.map((model)=> Tennant.fromJson(model)));

    response = await ApiClient().getClient(logInfo, {}, "");

    reponseDecoded = jsonDecode(response.body);
    List<ErrorLog> errorLog = List<ErrorLog>.from(reponseDecoded.map((model)=> ErrorLog.fromJson(model)));

    print(tennants[0].tennantName);
    print(errorLog[0].log);

    Navigator.pushReplacementNamed(context, "/home", arguments: data);

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