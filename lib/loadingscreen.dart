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
  // Endpoint values
  final String logInfo = "app/errors";
  final String latestLogInfo = "app/lasterrors";
  final String homeInfo = "app/homeinfo";
  final String tennantInfo = "app/tennants";

  ApiClient apiClient = new ApiClient();
  List data;

  String recievedHomeInfo;
  // Value to determine which method to be loaded. Value is changed in home.dart
  String endPointChanger;

  @override
  void initState() {
    super.initState();
  }

  /*
   *  Methods underneath send a POST requset to a backend.
   *  Data arrives as JSON and is decoded in each method for it to be used further in the app
   *  Changes screen with pushreplacementNamed when all data is retrieved
   */

  // Retrieves number of tennants and errors
  Future<void> getNumberOfTennantsAndErrors() async {
    Response response =
        await ApiClient().getClient(apiClient.baseURL + homeInfo, {}, "");

    recievedHomeInfo = jsonDecode(response.body);

    Navigator.pushReplacementNamed(context, "/home",
        arguments: recievedHomeInfo);
  }

  // Retrieves information about tennants
  Future<void> getTennantData() async {
    Response response =
        await ApiClient().getClient(apiClient.baseURL + tennantInfo, {}, "");

    Iterable responseDecode = jsonDecode(response.body);
    List<Tennant> tennants = List<Tennant>.from(
        responseDecode.map((model) => Tennant.fromJson(model)));

    Navigator.pushReplacementNamed(context, "/home/tennantListView",
        arguments: tennants);
  }

  // Retrieves errors last 24 hours as a list
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
// Retrieves all errors as a list
  Future<void> getErrors() async {
    Response response =
        await ApiClient().getClient(apiClient.baseURL + logInfo, {}, "");

    Iterable responseDecode = jsonDecode(response.body);
    List<ErrorLog> errorLog = List<ErrorLog>.from(
        responseDecode.map((model) => ErrorLog.fromJson(model)));

    Navigator.pushReplacementNamed(context, "/home/logListView",
        arguments: errorLog);
  }

  /*
   *  A switch case used to determine which method should be called
   *  the variable endpointchanger changes in the home.dart file depending on which button is pressed
   */
  void changeView() {
    switch (endPointChanger) {
      case "tennants":
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
