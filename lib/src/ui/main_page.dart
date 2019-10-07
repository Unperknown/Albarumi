import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AlbarumiMainPage extends StatefulWidget {
	@override
	MainState createState() => MainState();
}

class MainState extends State<AlbarumiMainPage> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: ListView(
					padding: EdgeInsets.all(40.0),
					children: <Widget>[
						SizedBox(height: 400.0),
						RaisedButton(
							child: Text('메인메인'),
							onPressed: () {
								Navigator.pop(context);
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
