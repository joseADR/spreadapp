import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spreadapp/components/cardinfo.dart';
import 'package:spreadapp/components/eventos.dart';
import 'dart:ui' as ui;

class ProfilePage extends StatefulWidget {
  ProfilePage(this.id);
  final id;
  @override
  _ProfilePageState createState() => _ProfilePageState(id);
}

class _ProfilePageState extends State<ProfilePage> {
  _ProfilePageState(this._id);
  String _id;
  String _name = '';
  //String _title = '';
  String _promo = '';
  //List <DocumentReference> _posts = [];
  String _seg = '';
  String _place = '';
  String _tag = '';
  //String _card = '';
  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('promoters').document(_id).get().then((data) {
      setState(() {
        this._name = data['nome'];
        this._place = data['localidade'];
        this._promo = data['promoter'];
        this._seg = data['seguidores'];
        this._tag = data['tag'];
        //this._posts = data['posts'].toList();
        //this._posts = data['posts'].toList();
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              snap: false,
              textTheme: Theme.of(context).primaryTextTheme,
              expandedHeight: MediaQuery.of(context).size.height / 1.3,
              elevation: 2.0,
              pinned: true,
              floating: false,
              forceElevated: true,
              title: null,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: GestureDetector(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7jQvJGTuC84pPzSxU1lzbYGyzEuT0d4JxVPvMHPFsonIxD9qS6Q',
                        fit: BoxFit.cover,
                      ),
                      BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ClipOval(
                                      child: Hero(
                                        tag: _promo,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9.4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5.5,
                                          decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    offset: Offset(0.5, 0.6),
                                                    blurRadius: 5.5),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(62.5),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(_promo))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      _name,
                                      style: TextStyle(
                                          color: Color(0xfff1f1f1),
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      _place,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.grey[400]),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 40.0),
                                      child: Divider(
                                        height: 8.0,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 135.0,
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Sobre Lucas',
                                      style:
                                          TextStyle(color: Color(0xfff1f1f1)),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    RichText(
                                      maxLines: 4,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                          text:
                                              'Andrew McLan "Andy" Fraser was an English songwriter and bass '
                                              'guitarist whose career lasted over forty years, and includes two spells '
                                              'as a member of the rock band Free, which he helped found in 1968, aged 15.'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 10.0,
                                color: Theme.of(context)
                                    .secondaryHeaderColor
                                    .withOpacity(0.1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child: Row(
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                _seg,
                                                style: TextStyle(
                                                  color: Color(0xfff1f1f1),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80.0),
                                              Text(
                                                'SEGUIDORES',
                                                style: TextStyle(
                                                    fontFamily: 'MontSerrat',
                                                    fontSize: 10.0,
                                                    color: Color(0xfff1f1f1)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 50.0,
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(height: 30.0),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 15.0),
                                                      child: OutlineButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                              side: BorderSide(
                                                                  color: Color(
                                                                      0xfff1f1f1),
                                                                  width: 0.1)),
                                                          child: Text(
                                                            'SEGUIR',
                                                            style: TextStyle(
                                                                fontSize: 11.0,
                                                                color: Color(
                                                                    0xfff1f1f1)),
                                                          ),
                                                          disabledBorderColor:
                                                              Theme.of(context)
                                                                  .buttonColor,
                                                          highlightedBorderColor:
                                                              Theme.of(context)
                                                                  .buttonColor,
                                                          highlightColor:
                                                              Theme.of(context)
                                                                  .buttonColor,
                                                          splashColor:
                                                              Colors.blue,
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xfff1f1f1)),
                                                          onPressed: () {} //{print(_posts);},
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40.0,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                _seg,
                                                style: TextStyle(
                                                  color: Color(0xfff1f1f1),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80.0),
                                              Text(
                                                'EVENTOS',
                                                style: TextStyle(
                                                    fontFamily: 'MontSerrat',
                                                    fontSize: 10.0,
                                                    color: Color(0xfff1f1f1)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 7.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ultimos Eventos',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: <Widget>[
                            buildImages(),
                            buildInfoDetail(),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: <Widget>[
                            buildImages(),
                            buildInfoDetail(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildImages() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
              MaterialPageRoute<Null>(
                builder: (BuildContext context) => CardPage(_id),
              ),
            ),
        child: Container(
          height: 90.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/spreadapp-c69a5.appspot.com/o/cardImg%2Fcarnarog.png?alt=media&token=bc622a79-0392-4047-b116-3b157330802a'),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget buildInfoDetail() {
    return Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 15.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 15.0),
              ),
              SizedBox(height: 7.0),
              Row(
                children: <Widget>[
                  Text(
                    'Promoter',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontFamily: 'Montserrat',
                        fontSize: 11.0),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    Icons.timer,
                    size: 4.0,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '3 Curtidas',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontFamily: 'Montserrat',
                        fontSize: 11.0),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
