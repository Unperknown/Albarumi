import 'package:flutter/material.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_bloc_provider.dart';

import '../utils/colors.dart';

class AlbarumiRegisterPage extends StatefulWidget {
	@override
	RegisterState createState() => RegisterState();
}

class RegisterState extends State<AlbarumiRegisterPage> {
  final _idController = TextEditingController();
  final _usernameController = TextEditingController();
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
            TextField(
              obscureText: true,
              controller: _idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                labelText: '이메일',
              ),
            ),
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
            TextField(
              obscureText: true,
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                labelText: '닉네임',
              ),
            ),
						RaisedButton(
							child: Text('가입하기'),
							onPressed: () {
                bloc.register(_usernameController.text, _idController.text, _passwordController.text)
                    .then((isRegistered) {
                      if (isRegistered) {
                        Navigator.pop(context);
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
					],
				),
			),
		);
	}
}
