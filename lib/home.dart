import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:albarumi/colors.dart';
import 'package:splashscreen/splashscreen.dart';

class AlbarumiApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      	return MaterialApp(
      		home: AlbarumiSplashScreen(),
		);
    }
}

class AlbarumiSplashScreen extends StatefulWidget {
	@override
	SplashScreenState createState() => SplashScreenState();
}

class AlbarumiHome extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class AlbarumiRegister extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class SplashScreenState extends State<AlbarumiSplashScreen> {
	@override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new AlbarumiHome(),
      title: new Text('올바르미',
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

class HomeState extends State<AlbarumiHome> {
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
        	    	  obscureText: true,
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
        	    	FlatButton(
        	    	    child: Text('아직 회원이 아니신가요?'),
        	    	    onPressed: () {
        	    	        Navigator.push(
        	    	        	context,
        	    	          	MaterialPageRoute(builder: (context) => AlbarumiRegister()),
        	    	        );
        	    	    },
					),
				],
        	),
        ),
      );
  	}
}

class RegisterState extends State<AlbarumiRegister> {
  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
     		body: Center(
        		child: ListView(
          			padding: EdgeInsets.all(40.0),
          			children: <Widget>[
						SizedBox(height: 400.0),
						RaisedButton(
        	    	    	child: Text('가입하기'),
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
