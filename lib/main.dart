import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/DateTime.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Screens/SetLocation.dart';
import 'package:flutter_application_1/Screens/SpalshScreen.dart';
import 'package:flutter_application_1/Screens/Dest.dart';
import 'package:flutter_application_1/Screens/Urgence.dart';
import 'package:flutter_application_1/Screens/google_map_clone.dart';
import 'package:provider/provider.dart';

import 'Screens/Rdv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        'SplashScreen': (context) => SplashScreen(),
        'Login': (context) => Login(),
        'SetLocation': (context) => SetLocation(),
        'Dest': (context) => Dest(),
        'Urgence': (context) => Urgence(),
      },
    );
  }
}
