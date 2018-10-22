import 'package:flutter/material.dart';
class FollowPage extends StatelessWidget {
  final String _title;
  final String _promo;
  //String data;
  FollowPage( this._title, this._promo,);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Theme.of(context).primaryColorDark.withOpacity(0.44),
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.7, top: 0.0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children:<Widget>[
              //imagem circular do promoter
                GestureDetector(
                  child: Container(
                margin: EdgeInsets.only(left: 8.0,top:8.0,bottom: 8.0),   
                width: 147.0,
                height: 85.0,
                child: Image.network(
                  (_promo), fit: BoxFit.cover,
                ),
              ),
            onTap: () =>  Navigator.of(context).push(
              MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(_title.toUpperCase(),
                      style: TextStyle(
                        fontSize:13.0
                      )
                    )),
                    body: new Stack(
                      fit: StackFit.loose,
            children: <Widget>[
               Container(color: Colors.black.withOpacity(0.4),
                  width: double.infinity,
                          height: 150.0,
                          child: Image.network(
                            _promo,
                            fit: BoxFit.cover
                          ),),
                
                                    
              ListView(
              children: <Widget>[
                Hero(
                        tag: 'posts',
                        child: SizedBox(
                          width: double.infinity,
                          height: 180.0,
                          child: Image.network(
                            _promo,
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                          Container(
                            width: 350.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 110.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          _promo),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 7.0, color: Colors.black)
                                  ])),
                          SizedBox(height: 90.0),
                          Text(
                            'Tom Cruise',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Subscribe guys',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Montserrat'),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                              height: 30.0,
                              width: 95.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Edit Name',
                                      style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                              SizedBox(height: 25.0),
                          Container(
                              height: 30.0,
                              width: 95.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.redAccent,
                                color: Colors.red,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Log out',
                                      style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ))
                ],
              )],),
            );}),),
            
                          ), 
                      ],
                  ),
                  ],
              ),
              );
              
          
          }
          
          }