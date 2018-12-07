import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//Google provider
import 'package:google_sign_in/google_sign_in.dart';
//Facebook provider
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;
  var accountStatus;
  var profileData;
  var _userId;
  bool newUser = false;
  var facebookLoginResult;

  String id;
  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
      //const userID = "12345" // ID after created the user.
    });
  }

  _getCurrentUser() async {
    mCurrentUser = await _auth.currentUser();
    print('Hello '.toString());
    setState(() {
      mCurrentUser != null ? mCurrentUser = mCurrentUser : newUser = true;
    });
  }

  //google sign in
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser mCurrentUser;
  GoogleSignIn googleSignIn;
  void _sign() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);
    //print("user Name: ${user.displayName}");
    Navigator.of(context).pushReplacementNamed('/home');
  }

  checkUser() async {
   newUser = await _getCurrentUser();
    if (mCurrentUser != null) {
      initiateFacebookLogin2();
    } 
    else {
      _login();
    }
  }
  var login;
  _login() async{
    login = await _initiateFacebookLogin1();
    if(isLoggedIn){
     _userId = await _getUserId();
    }
    else {
      print("fatal error");
    }
  }

  _getUserId() async {
    await new Future.delayed(const Duration(seconds : 3));
    _userId = await _auth.currentUser();
    print('Hello'.toString());
    setState(() {
      _userId != null ? _userId = _userId : print('não deu');
    });

    if( _userId != null ){
       _onCreate();
     }
  }

  _onCreate() async {
    await Firestore.instance
        .collection("users")
        .document(_userId.uid)
        .setData(profileData);
    await new Future.delayed(const Duration(seconds : 1));
    Navigator.of(context).pushReplacementNamed('/home');
  }

  //Facebook sign in
  _initiateFacebookLogin1() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        FirebaseAuth.instance.signInWithFacebook(
            accessToken: facebookLoginResult.accessToken.token);
        print("LoggedIn");
        var graphResponse = await http.get(
            'https://graph.facebook.com/v3.1/me?fields=name,first_name,last_name,email,picture.height(300)&access_token=${facebookLoginResult.accessToken.token}');
        var profile = json.decode(graphResponse.body);
        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }

  initiateFacebookLogin2() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        FirebaseAuth.instance.signInWithFacebook(
            accessToken: facebookLoginResult.accessToken.token);
        print("LoggedIn");
        onLoginStatusChanged(true);
        Navigator.of(context).pushReplacementNamed('/home');
        break;
    }
  }

  _displayLoginButton() {
    return OutlineButton(
        borderSide: BorderSide(
            width: 0.5,
            color: Color(0xfff1f1f1).withOpacity(0.9),
            style: BorderStyle.solid),
        splashColor: Colors.blue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          //width: 250.0,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('android/assets/facebook-logo.jpg'),
                      fit: BoxFit.cover),
                ),
                height: 28.0,
                width: 28.0,
              ),
              SizedBox(
                width: 31.0,
              ),
              Text(
                'Entrar com o Facebook',
                style: TextStyle(
                    fontFamily: 'MontSerrat',
                    color: Color(0xfff1f1f1),
                    fontSize: 14.0),
              ),
            ],
          ),
        ),
        onPressed: () => checkUser());
  }

  //bool readResult = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [
                    const Color(0xff3399ff),
                    const Color(0xff002e4d)
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(25.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          Container(
                            height: 200.0,
                            width: 200.0,
                            child: Image.asset(
                              'android/assets/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 50.0,
                            width: 150.0,
                            child: Image.asset('android/assets/escrita.png'),
                          ),
                          SizedBox(height: 25.0),
                          Column(
                            children: <Widget>[
                              _displayLoginButton(),
                              SizedBox(height: 5.0),
                              OutlineButton(
                                borderSide: BorderSide(
                                    width: 0.5,
                                    color: Color(0xfff1f1f1).withOpacity(0.9),
                                    style: BorderStyle.solid),
                                splashColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Container(
                                  //width: 230.0,
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'android/assets/google-logo.jpg'),
                                              fit: BoxFit.cover),
                                        ),
                                        height: 28.0,
                                        width: 28.0,
                                      ),
                                      SizedBox(
                                        width: 40.0,
                                      ),
                                      Text(
                                        'Entrar com o Google',
                                        style: TextStyle(
                                            fontFamily: 'MontSerrat',
                                            color: Color(0xfff1f1f1),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () => _sign(),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              OutlineButton(
                                splashColor: Colors.blue,
                                highlightElevation: 10.0,
                                borderSide: BorderSide(
                                    width: 0.5, color: Colors.white70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Container(
                                  width: 180.0,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Entrar como visitante',
                                        style: TextStyle(
                                            fontFamily: 'MontSerrat',
                                            color: Color(0xfff1f1f1),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: Row(
                                  children: <Widget>[
                                    //Checkbox(
                                    //  value: false,
                                    //),
                                    Text(
                                      'Aceito os Termos de Uso e Privacidade',
                                      style: TextStyle(
                                          fontSize: 13.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
