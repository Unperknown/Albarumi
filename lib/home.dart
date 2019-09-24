import 'package:flutter/material.dart';

class AlbarumiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlbarumiHome(),
    );
  }
}

class AlbarumiHome extends StatefulWidget {
  @override
  _AlbarumiState createState() => _AlbarumiState();
}

class _AlbarumiState extends State<AlbarumiHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/logo.png'),
                SizedBox(height: 16.0),
              ],
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '아이디',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '비밀번호',
              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('로그인'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
