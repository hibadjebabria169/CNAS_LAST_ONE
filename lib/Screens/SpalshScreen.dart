import 'package:flutter/material.dart';

import 'package:flutter_application_1/Buttons/Button.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          color: Colors.red,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 70),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(),
                    //Image.asset('assets/images/cnaslogo.png'),
                    customButton(Colors.orange, 'Commencer', Colors.blue),
                  ]),
            ),
          ),
        )
        /* Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 70),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               // SizedBox(),
                // Image.asset('assets/images/cnaslogo.png'),
                Button(
                  text: 'Commencer',
                  onPressed: () => Navigator.of(context).pushNamed('Login'),
                  color: Colors.blue,
                  bgcolor: Colors.white,
                ),
              ]),
        ),
        )
        */
        ); */
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 30),
              Image.asset('assets/images/cnaslogo.png',
                  width: 300, height: 300),
              SizedBox(
                height: 50,
                width: 400,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('Login');
                  },
                  child: Text(
                    'Commencer',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
