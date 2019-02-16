import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:spreadapp/Home/home.dart';
import 'package:spreadapp/config/loginPage.dart' as login;
import 'package:spreadapp/services/root_Page.dart';


const api_key = "AIzaSyDQIQ6TK-F0NCvvVvx-eaeqPVUL1K0ClPE";

RootPage appAuth = RootPage();
void main(){
  MapView.setApiKey(api_key);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(''),
        '/login': (BuildContext context) => login.LoginPage(),
      }));
}