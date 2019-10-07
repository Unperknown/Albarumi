import 'package:flutter/material.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_bloc_provider.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';

import 'register_page.dart';
import 'main_page.dart';

class AlbarumiLoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<AlbarumiLoginPage> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(height / 15.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: height / 4.0),
                Text(
                  Strings.logo,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'TmonMonsori',
                    color: AlbarumiDarkColor,
                  ),
                ),
                SizedBox(height: height / 5.0),
              ],
            ),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                labelText: Strings.idField,
              ),
            ),
            SizedBox(height: height / 80.0),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                labelText: Strings.passwordField,
              ),
            ),
            SizedBox(height: height / 80.0),
            RaisedButton(
              child: Text(Strings.login),
              onPressed: () {
                bloc.signIn(_idController.text, _passwordController.text)
                    .then((isSignIn) {
                          if (isSignIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AlbarumiMainPage()),
                            );
                          }
                        });
              },
              textColor: Colors.white,
              color: AlbarumiDarkColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
            FlatButton(
              child: Text(Strings.notSignUp),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AlbarumiRegisterPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
