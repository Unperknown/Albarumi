import 'package:flutter/material.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_bloc_provider.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import '../utils/widgets.dart';

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
                SizedBox(height: height / 8.0),
                Widgets.logo(),
                SizedBox(height: height / 5.0),
              ],
            ),
            Widgets.inputButton(_idController, Strings.idField, false),
            SizedBox(height: height / 80.0),
            Widgets.inputButton(
                _passwordController, Strings.passwordField, true),
            SizedBox(height: height / 80.0),
            Widgets.loginButton(() => {
                  bloc
                      .signIn(_idController.text, _passwordController.text)
                      .then((isSignIn) {
                    if (isSignIn) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlbarumiMainPage()),
                      );
                    }
                  })
                }),
            Widgets.registerButton(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlbarumiRegisterPage()),
              );
            }),
            Widgets.dividers(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Widgets.imageButton(
                    "assets/images/google_logo.png",
                    Colors.white,
                    () => {
                          bloc.signInWithGoogle().then((isSignIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlbarumiMainPage()),
                            );
                          })
                        }),
                Widgets.imageButton(
                  "assets/images/kakaotalk_logo.png",
                  KakaoTalkColor,
                  () => {},
                ),
                Widgets.imageButton(
                  "assets/images/facebook_logo.png",
                  FacebookColor,
                  () => {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
