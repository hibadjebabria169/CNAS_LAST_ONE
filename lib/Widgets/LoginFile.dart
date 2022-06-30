import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Buttons/Button.dart';

class LoginFile extends StatefulWidget {
  const LoginFile({Key? key}) : super(key: key);

  @override
  State<LoginFile> createState() => _LoginFileState();
}

class _LoginFileState extends State<LoginFile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Entrez votre e-mail',
                      hintText: 'ex: Username@gmail.com',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Entrez votre mot de passe',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: RaisedButton(
                      onPressed: () async {
                        if ((await login()) == 200)
                          Navigator.of(context).pushNamed('SetLocation');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 29),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final url = "https://ddbf-105-235-129-35.ngrok.io/api/v1/login-patient";

Future<int> login() async {
  try {
    Dio client = Dio();
    final response = await client
        .post(url, data: {"email": "patient@cnas.dz", "password": "root"});
    print(response.statusCode);
    return response.statusCode ?? 500;
  } catch (err) {
    return 500;
    print(err);
  }
}
