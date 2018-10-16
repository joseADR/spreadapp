import 'package:flutter/material.dart';
class Post extends StatelessWidget {
  final String _title;
  final String _card;
  final String _promo; 
  final String _data;
  final String _local;
  String card;
  Post( this._title, this._card, this._promo, this._data, this._local);
  @override
  Widget build(BuildContext context) {
    return 
    Card(
      elevation: 8.0,
      color: Theme.of(context).primaryColorDark.withOpacity(0.44),
      margin: const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0, top: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //Title and Image
          Row(
            children:<Widget>[
              //Perfil Circle Image
              Container(
                margin: EdgeInsets.only(top: 5.0, left: 4.0, right: 10.0, bottom: 6.0),
                width: 21.0,
                height: 21.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_promo),
                  ),
                ),
              ),
              //Title container
              Expanded(
                child: Text(
                  _title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ],
          ),
          //Container for image
          GestureDetector(
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
                    body:
                    
                       ListView(
                        children: <Widget>[
                          Container(
                      padding: const EdgeInsets.only(top:4.0,left: 0.0, right: 0.0),
                      alignment: Alignment.topLeft,
                      // Use background color to emphasize that it's a new route.
                      color:Theme.of(context).primaryColorDark.withOpacity(0.6),
                      child:Column(
                        children:<Widget>[
                          Hero(
                        tag: 'posts',
                        child: SizedBox(
                          width: double.infinity,
                          height: 220.0,
                          child: Image.network(
                            _card,
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:10.0,bottom: 10.0),
                        child: Text(_title.toUpperCase(),
                          style:TextStyle(
                            fontWeight:FontWeight.bold
                          ),),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            IconButton(
                              icon:Icon(Icons.thumb_up),
                              onPressed: null,
                            ),
                            IconButton(
                              icon:Icon(Icons.check_circle_outline),
                              onPressed: null,
                            ),
                            IconButton(
                              icon:Icon(Icons.favorite_border),
                              onPressed: null,
                            ),
                            IconButton(
                              icon:Icon(Icons.share),
                              onPressed: null,
                            ),
                          ]
                        ),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:10.0),
                        child: Column(

                          children: <Widget>[
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children:<Widget>[
                                         Container(
                                           child: Row(
                                             children: <Widget>[
                                               Container(
                                                 child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children:<Widget>[
                                                     Container(
                                                       decoration: BoxDecoration(
                                                        shape:BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: NetworkImage(_promo),
                                                          fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        width: 35.0, 
                                                        height: 35.0,
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                               
                                               Container(
                                                child:Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children:<Widget>[
                                                   FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:BorderRadius.circular(20.0),
                                                  ),
                                                  onPressed: () => {},
                                                  color: Colors.blue,
                                                  child: Column( // Replace with a Row for horizontal icon + text
                                                    children: <Widget>[
                                                      Icon(Icons.add),
                                                      Text("Seguir")
                                                    ],
                                                  ),
                                                ),
                                                  ],
                                               ),
                                               ),
                                             ],
                                          ),
                                        ),
                                        Container(
                                          child:Row(
                                            children: <Widget>[
                                              Icon(Icons.location_on),
                                              Text(_local,
                                              style:TextStyle(
                                                   fontSize: 11.0,
                                                 )
                                              )
                                            ],
                                          ), 
                                        ),
                                        Divider(
                                          height: 5.0,
                                        ),
                                        Container(
                                          child: Icon(Icons.timer),
                                        ),
                                        Divider(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.symmetric(horizontal:10.0),
                              child:Text(
                                'Descrição',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              height: 20.0,
                            ),
                            Container(
                              //margin: EdgeInsets.symmetric(horizontal:10.0),
                              child: Text(
                                'A única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério. É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.'
                              ),
                            ),
                            Divider(
                              height: 20.0,
                            ),
                            Container(

                            ),
                          ],
                        ),
                      ),
                        ],
                       
                      ),
                    ), 
                       
                        ],
                       )
          );
          
                },
              )
            ),
             
            
            child:
              Container(
                margin: EdgeInsets.only(left: 2.0, right: 2.0, top: 1.0,bottom: 1.0),
                color: Color.fromRGBO(200,200,200,.5),
                width: double.infinity,
                height: 180.0,
                child: Image.network(_card, fit: BoxFit.cover),
              )
          ),
          //Buttons Container
          Container(
            margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
            child: Column(
              children: <Widget> [
                //Row with buttons
                Row(
                  children: <Widget>[        
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          Container(
                            //padding: EdgeInsets.only(left: 0.8),
                            padding: EdgeInsets.only(right: 15.0,left: 13.5,top: 10.0, bottom: 15.0),
                            child: Icon(Icons.favorite_border, size: 24.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                                //Share Button 
                          Container(
                            //padding: EdgeInsets.only(left: 0.8),
                            padding: EdgeInsets.only(right: 10.0,left: 0.0,top: 10.0, bottom: 15.0),
                            child: Icon(Icons.share, size: 24.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                          Container(
                            padding: EdgeInsets.only(left:62.0,),
                            child: 
                              Text(_data.toUpperCase(),
                                style:TextStyle(
                                  fontSize: 14.0,
                                  color:Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ), 
                          Container(
                            padding: EdgeInsets.only(right: 0.0, left: 110.0, top: 10.0, bottom: 15.0),
                            child: Icon(Icons.more_vert,size: 23.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              //Find More
            ],
          ),
        ),
      ],
    ),
  );
}
}
