import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Google provider


//Facebook provider
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  String _email;
  String _password;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }
  //google sign in
 

  //Facebook sign in
  FacebookLogin fbLogin = new FacebookLogin();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new NetworkImage("https://media.gettyimages.com/photos/dark-blue-gradient-background-picture-id465275407?b=1&k=6&m=465275407&s=612x612&w=0&h=z9jO_kfu9F4isGf5yK5yfJig7TtojQ58yeYyuZDgh6U="),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Center(
                child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(
                      size: _iconAnimation.value * 140.0,
                    ),
                    
                    SizedBox(height: 100.0),
                    
                    SizedBox(height: 15.0),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius:(BorderRadius.circular(4.0))),
                      child: Text('Entrar com o Facebook'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () {
                        fbLogin.logInWithReadPermissions(
                            ['email', 'public_profile']).then((result) {
                          switch (result.status) {
                            case FacebookLoginStatus.loggedIn:
                              FirebaseAuth.instance
                                  .signInWithFacebook(
                                      accessToken: result.accessToken.token)
                                  .then((signedInUser) {
                                print('Signed in as ${signedInUser.displayName}');
                                Navigator
                                    .of(context)
                                    .pushReplacementNamed('/home');
                              }).catchError((e) {
                                print(e);
                              });
                              break;
                            case FacebookLoginStatus.cancelledByUser:
                              print('Cancelled by you');
                              break;
                            case FacebookLoginStatus.error:
                              print('Error');
                              break;
                          }
                        }).catchError((e) {
                          print(e);
                        });
                      },
                    ),
                    SizedBox(height: 15.0),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius:(BorderRadius.circular(4.0))),
                      child: Text('Entrar com o Google'),
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () {} 
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
);
}
}
