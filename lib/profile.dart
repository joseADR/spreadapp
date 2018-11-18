import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spreadapp/components/cardinfo.dart';
import 'package:spreadapp/components/eventos.dart';
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
  List <DocumentReference> _posts = [];
  String _seg = '';
  String _place = '';
 
  @override
  void initState(){
    super.initState();
    Firestore.instance.collection('promoters').document(_id).get().then((data) {
        setState(() {
          this._name = data['nome'];
          this._place = data['localidade'];
          this._promo = data['promoter'];
          this._seg = data['seguidores'];  
          this._posts = data['posts'].toList();
        });
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top:7.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: _promo,
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.5,0.6),
                        blurRadius: 5.5
                      ),
                    ],
                      borderRadius: BorderRadius.circular(62.5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_promo))),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                _name,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                _place,
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                color: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          child: ButtonBar(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:<Widget>[
                                  Text(
                                    _seg
                                  ),
                                  Text('SEGUIDORES',
                                    style: TextStyle(
                                      fontFamily: 'MontSerrat',
                                      fontSize: 12.0,
                                      color: Theme.of(context).buttonColor
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.0,),
                              Container(
                                child: Row(
                                  children:<Widget>[
                                    SizedBox(height:30.0),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:<Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 15.0),
                                          child: OutlineButton(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                            child: Text('SEGUIR',
                                              style: TextStyle(
                                                color: Theme.of(context).buttonColor,
                                                ),
                                              ),
                                            disabledBorderColor: Theme.of(context).buttonColor,
                                            highlightedBorderColor: Theme.of(context).buttonColor,
                                            highlightColor: Theme.of(context).buttonColor,
                                            splashColor: Colors.blue,
                                            borderSide: BorderSide(
                                              color: Theme.of(context).buttonColor,
                                            ),
                                            onPressed: () {print(_posts);}, 
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),   
                              ),
                              SizedBox(height: 30.0,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:<Widget>[
                                  IconButton(
                                    icon: Icon(Icons.event),
                                    splashColor: Colors.blue,
                                    onPressed:  () =>  Navigator.of(context).push(
                                    MaterialPageRoute<Null>(
                                      builder: (BuildContext context) => EventsPage(),
                                      ),
                                    ),
                                  ),
                                  Text('EVENTOS',
                                    style: TextStyle(
                                      fontFamily: 'MontSerrat',
                                      fontSize: 12.0,
                                      color: Theme.of(context).buttonColor
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Ultimos Eventos',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ), 
              ),
              buildImages(),
              buildInfoDetail(),
              buildImages(),
              buildInfoDetail(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImages() {
    
    return Padding(
      padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child:
        GestureDetector(
          onTap: () =>  Navigator.of(context).push(
              MaterialPageRoute<Null>(
                builder: (BuildContext context) => CardPage(_id),
            ),
          ),
        child:
        Container(
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: NetworkImage(_promo),
              fit: BoxFit.cover
            ),
          ),
        ),
      ),
    );
  }
  Widget buildInfoDetail() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 7.0),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:NetworkImage('https://cinema10.com.br/upload/filmes/filmes_11871_chap12.jpg')
                    ),
                  ),
                  height: 20.0,
                  width: 20.0,
                  
                ),
              ),
              SizedBox(width: 7.0),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:NetworkImage('https://cinema10.com.br/upload/filmes/filmes_11871_chap12.jpg')
                    ),
                  ),
                  height: 20.0,
                  width: 20.0,
                ),
              ),
              SizedBox(width: 7.0),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:NetworkImage('https://cinema10.com.br/upload/filmes/filmes_11871_chap12.jpg')
                    ),
                  ),
                  height: 22.0,
                  width: 22.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}