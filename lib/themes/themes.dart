import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: Color(0xffbe9e9f0),
      canvasColor: creamColor,
      buttonColor: darkCreamColor,
      accentColor: darkCreamColor,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            fontSize: 16,
            color: Color(0xff192e51),
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Color(0xfff000000),
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold),
      ));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Color(0xffb111828);
  static Color lightBluishColor = Color(0xffb3e4d64);
}
