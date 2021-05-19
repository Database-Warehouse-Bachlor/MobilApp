import 'package:flutter/material.dart';
import 'package:mobilapp/tennant.dart';

class Tennant_View extends StatefulWidget {
  @override
  _Tennant_ViewState createState() => _Tennant_ViewState();
}

class _Tennant_ViewState extends State<Tennant_View> {
  List<Tennant> data;

  /*
   *  This widget generates a viewlist that lists all tennants
   */
  @override
  Widget build(BuildContext context) {

    // Retrieves arguments from another widget
    data = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: Text("Liste over tennants"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.brown[100]),
        child: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
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
                                data[index].tennantName,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
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
                              SizedBox(height: 3),
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
                              SizedBox(height: 3),
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
