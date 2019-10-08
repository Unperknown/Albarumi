import 'package:flutter/material.dart';

import 'strings.dart';
import 'colors.dart';

class Widgets {
  static Widget logo() {
    return Text(
      Strings.logo,
      style: TextStyle(
        fontSize: 60.0,
        fontFamily: 'TmonMonsori',
        color: AlbarumiDarkColor,
      ),
    );
  }

  static Widget inputButton(controller, labelText, isSecured) {
    return TextField(
      obscureText: isSecured,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(15.0),
        ),
        labelText: labelText,
      ),
    );
  }

  static Widget loginButton(onPressed) {
    return RaisedButton(
      child: Text(Strings.login),
      onPressed: onPressed,
      textColor: Colors.white,
      color: AlbarumiDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 15.0),
    );
  }

  static Widget registerButton(onPressed) {
    return FlatButton(
      child: Text(Strings.notSignUp),
      onPressed: onPressed,
    );
  }

  static Widget dividers() {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
      Text(Strings.alter),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
    ]);
  }

  static Widget imageButton(imagePath, backgroundColor, onPressed) {
    return new RawMaterialButton(
      onPressed: () => onPressed,
      child: new Image(
        image: AssetImage(imagePath),
        height: 40.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: backgroundColor,
      padding: const EdgeInsets.all(10.0),
    );
  }
}
