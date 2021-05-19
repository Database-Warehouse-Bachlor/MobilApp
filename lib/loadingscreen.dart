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
  final String logInfo = "app/errors";
  final String latestLogInfo = "app/lasterrors";
  final String homeInfo = "app/homeinfo";
  final String tennantInfo = "app/tennants";

  ApiClient apiClient = new ApiClient();
  List data;

  String recievedHomeInfo;
  String endPointChanger;

  @override
  void initState() {
    super.initState();
    // this.getNumberOfTennantsAndErrors();
  }

  Future<void> getNumberOfTennantsAndErrors() async {
    Response response =
        await ApiClient().getClient(apiClient.baseURL + homeInfo, {}, "");

    recievedHomeInfo = jsonDecode(response.body);

    Navigator.pushReplacementNamed(context, "/home",
        arguments: recievedHomeInfo);
  }

  Future<void> getTennantData() async {
    Response response =
        await ApiClient().getClient(apiClient.baseURL + tennantInfo, {}, "");

    Iterable responseDecode = jsonDecode(response.body);
    List<Tennant> tennants = List<Tennant>.from(
        responseDecode.map((model) => Tennant.fromJson(model)));

    Navigator.pushReplacementNamed(context, "/home/tennantListView",
        arguments: tennants);
  }

  Future<void> getLatestErrors() async {
    Response response =
        await ApiClient().getClient(apiClient.baseURL + latestLogInfo, {}, "");

    Iterable responseDecode = jsonDecode(response.body);
    List<ErrorLog> errorLog = List<ErrorLog>.from(
        responseDecode.map((model) => ErrorLog.fromJson(model)));
    print(responseDecode);

    Navigator.pushReplacementNamed(context, "/home/logListView",
        arguments: errorLog);
  }

  Future<void> getErrors() async {
    Response response =
        await ApiClient().getClient(apiClient.baseURL + logInfo, {}, "");

    Iterable responseDecode = jsonDecode(response.body);
    List<ErrorLog> errorLog = List<ErrorLog>.from(
        responseDecode.map((model) => ErrorLog.fromJson(model)));

    Navigator.pushReplacementNamed(context, "/home/logListView",
        arguments: errorLog);
  }

  void changeView() {
    switch (endPointChanger) {
      case "tennants":
        print("IM HERE NOW =============================");
        this.getTennantData();
        break;
      case "logList":
        this.getErrors();
        break;
      case "logErrorLastTwentyFour":
        this.getLatestErrors();
        break;
      default:
        this.getNumberOfTennantsAndErrors();
        break;
    }
  }

  // Future<void> getJsonData() async {
  //   Response response =
  //       await ApiClient().getClient(apiClient.baseURL + tennantInfo, {}, "");
  //
  //   Iterable reponseDecoded = jsonDecode(response.body);
  //   List<Tennant> tennants = List<Tennant>.from(
  //       reponseDecoded.map((model) => Tennant.fromJson(model)));
  //
  //   response = await ApiClient().getClient(logInfo, {}, "");
  //
  //   reponseDecoded = jsonDecode(response.body);
  //   List<ErrorLog> errorLog = List<ErrorLog>.from(
  //       reponseDecoded.map((model) => ErrorLog.fromJson(model)));
  //
  //   print(tennants[0].tennantName);
  //
  //   Navigator.pushReplacementNamed(context, "/home", arguments: data);
  // }

  @override
  Widget build(BuildContext context) {
    endPointChanger = ModalRoute.of(context).settings.arguments;
    this.changeView();
    print("===========WIDGET===============");
    print(endPointChanger);
    print("===========WIDGET===============");
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
