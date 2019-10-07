import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../utils/colors.dart';
import 'login_page.dart';

class AlbarumiSplashScreen extends StatefulWidget {
	@override
	SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<AlbarumiSplashScreen> {
	@override
	Widget build(BuildContext context) {
		return new SplashScreen(
			seconds: 3,
			navigateAfterSeconds: new AlbarumiLoginPage(),
			title: new Text(
				'올바르미',
				style: new TextStyle(
					fontFamily: 'TmonMonsori',
					fontSize: 60.0,
					color: Colors.white,
				),
			),
			backgroundColor: AlbarumiDarkColor,
			styleTextUnderTheLoader: new TextStyle(),
			loaderColor: Colors.white,
		);
	}
}