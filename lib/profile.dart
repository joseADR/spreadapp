import 'package:flutter/material.dart';
import 'package:spreadapp/components/cardinfo.dart';
import 'package:spreadapp/components/eventos.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
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
                tag: 'https://media-cdn.tripadvisor.com/media/photo-s/04/c2/bf/8f/cervejaria-bohemia.jpg',
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
                          image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/04/c2/bf/8f/cervejaria-bohemia.jpg'))),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'BOHEMIA',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                'Petrópolis, RJ',
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
                                  IconButton(
                                    icon: Icon(Icons.people),
                                    splashColor: Colors.blue,
                                    onPressed:  () {},
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
                                            onPressed: () {}, 
                                          ),
                                        ),
                                        //SizedBox(height: 5.0,), 
                                        //Text('SEGUIR',
                                        //style: TextStyle(
                                        //  fontFamily: 'MontSerrat',
                                        //  fontSize: 12.0,
                                        //  color: Colors.grey,
                                        //  ),
                                        //),
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
                builder: (BuildContext context) => CardPage(''),
            ),
          ),
        child:
        Container(
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: NetworkImage('https://lh3.googleusercontent.com/proxy/pvY4Y-_8-LI1VfYEilExPmR1Ps1N6_5ZXS8NCM7R5FvtJIZDApARtK59jDTB7B765RDn97R0OS44jkZX5R3vyjaawtY6H2o=w530-h298-n-rw'),
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
                'Maiara e Maraisa - 8 Dias atrás',
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