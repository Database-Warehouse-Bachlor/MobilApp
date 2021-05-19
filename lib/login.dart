import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobilapp/authorize.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailField = TextEditingController();
  final passwordField = TextEditingController();

  @override
  void dispose() {
    emailField.dispose();
    passwordField.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/4_3_logo_tekst.png',
                height: 130,
                width: 230),
              SizedBox(height: 20),
              Text('Cordel Norge AS', style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey[800]
              ),
              ),
              SizedBox(height: 40.0),
              TextField(
                key: Key("emailField"),
                controller: emailField,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrange
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              TextField(
                key: Key("passwordField"),
                controller: passwordField,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Passord',
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrange
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.all(25.0),
                child: SizedBox(width: 200.0,
                  child: RaisedButton(
                    key: Key("loginBtn"),
                    onPressed: () async {


                    String email = emailField.text.toString();
                    String password = passwordField.text.toString();

                    print(email);
                    print(password);

                    bool loginSuccessful = await Authorize().authorize(email, password, context);

                    //If everything is ok, sends to home page
                    if(loginSuccessful) {
                      Navigator.pushReplacementNamed(context, "/loading");
                    }

                  },
                    padding: new EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Text('Logg inn ',
                        style: TextStyle(fontSize: 24.0,
                          color: Colors.grey[900],
                        )
                    ),
                    color: Colors.orange[800],

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}