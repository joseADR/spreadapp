import 'package:flutter/material.dart';
final ThemeData SpreadLight = new ThemeData(
  backgroundColor: Color(0xffE0E0E0),
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  primaryColor: Color(0xffFFFFFF),
  primaryColorBrightness: Brightness.light,
  accentColor: Colors.blue,
  primaryTextTheme: TextTheme(title: TextStyle(color:Colors.black,fontFamily: 'MontSerrat')),
  accentColorBrightness: Brightness.light,
  splashColor: Colors.blue,
  iconTheme: IconThemeData(color: Colors.black),
  textSelectionColor: Colors.blue,
);
final ThemeData SpreadDark = new ThemeData(
  backgroundColor: Color(0xff212121),
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  primaryColor: Color(0xff1e1e1e),
  primaryColorBrightness: Brightness.dark,
  accentColor: Colors.blue,
  accentColorBrightness: Brightness.dark,
  splashColor: Colors.blue[300],
  primaryTextTheme: TextTheme(title: TextStyle(color:Colors.white,fontFamily: 'MontSerrat')),
  iconTheme: IconThemeData(color: Colors.white30),
  textSelectionColor: Colors.blue,
);  
