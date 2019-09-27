import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Albarumi/colors.dart';
import 'package:Albarumi/api.dart';
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
                SizedBox(height: 50.0),
                Text(
                  '올바르미',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'TmonMonsori',
                    color: AlbarumiDarkColor,
                  ),
                ),
                SizedBox(height: 150.0),
              ],
            ),
            googleLoginButton(),
            SizedBox(height: 10.0),
            MaterialButton(
              color: KakaoTalkColor,
              height: 50.0,
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage("assets/images/kakaotalk_logo.png"), height: 35.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '카카오톡으로 로그인',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlbarumiRegister()),
                );
              },
            ),
            SizedBox(height: 10.0),
            facebookLoginButton(),
            SizedBox(height: 10.0),
            MaterialButton(
              color: AlbarumiDarkColor,
              height: 50.0,
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '올바르미 계정으로 로그인',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlbarumiRegister()),
                );
              },
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
