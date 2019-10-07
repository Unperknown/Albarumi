import 'package:flutter/material.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_bloc_provider.dart';

import '../utils/colors.dart';
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
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(40.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 240.0),
                Text(
                  '올바르미',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'TmonMonsori',
                    color: AlbarumiDarkColor,
                  ),
                ),
                SizedBox(height: 200.0),
              ],
            ),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                labelText: '아이디',
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                labelText: '비밀번호',
              ),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('로그인'),
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
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
              ),
            ),
            FlatButton(
              child: Text('아직 회원이 아니신가요?'),
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
