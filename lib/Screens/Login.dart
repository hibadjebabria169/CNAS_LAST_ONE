import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../Widgets/LoginFile.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(height: 0),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Center(
                      child: Image.asset(
                        'assets/images/cnaslogo.png',
                        height: 250,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          LoginFile(),
        ],
      ),
    ));
  }
}
