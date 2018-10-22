import 'package:flutter/material.dart';
class Post extends StatelessWidget {
  final String _title;
  final String _card;
  final String _promo; 
  final String _data;
  final String _local;
  Post( this._title, this._card, this._promo, this._data, this._local);
  @override
  Widget build(BuildContext context) {
    return 
    Card(
      elevation: 2.0,
      color: Theme.of(context).primaryColorDark.withOpacity(0.44),
      margin: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 3.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //Title and Image
          Row(
            children:<Widget>[
              //Perfil Circle Image
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
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
                    backgroundColor:Theme.of(context).primaryColor.withOpacity(0.50),
                    appBar: AppBar(
                      title: Text(_title.toUpperCase(),
                      style: TextStyle(
                        fontSize:14.0
                      )
                    ),
                    ),
                    body:
                       NestedScrollView(
                         headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled){
                    return <Widget> [
                      SliverAppBar(
                        textTheme: Theme.of(context).primaryTextTheme,
                        expandedHeight: 220.0,
                        elevation: 3.0,
                        pinned: true,
                        floating: false,
                        forceElevated: innerboxIsScrolled,
                        title: null,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: false,
                          background: Image.network(_card,
                          fit: BoxFit.cover,
                          ),
                        ),
                    ),];
                        },
                      body:ListView(
                        children:<Widget>[
                      Container(
                        child:
                          Text(_title.toUpperCase(),
                            style:TextStyle(
                              fontWeight:FontWeight.bold
                              ),
                            ),
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
                              
                              //margin: EdgeInsets.symmetric(horizontal:10.0),
                              child:Text(
                                'Descrição',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children:<Widget>[
                                                     
                                               Container(
                                                child:Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children:<Widget>[
                                                      Text(_data.toUpperCase(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16.0,
                                                      ),
                                                      ),
                                                    ],
                                                  ),
                                                
                                                  
                                               ),
                                               
                                             ],
                                          ),
                                        ),
                                        Container(
                                          child:Column(
                                            
                                                  children:<Widget>[
                                                    Icon(Icons.location_on),
                                                    Text(_local,
                                                    style:TextStyle(
                                                      fontSize: 13.0,
                                                      )
                                                    ),
                                                
                                              
                                                    Container(
                                          child:Column(
                                            children: <Widget>[
                                              Container(
                                                child: Row(
                                                  children:<Widget>[
                                                    Icon(Icons.timer),
                                                    Text('Início 13:50 Término 18.30'),
                                                  ],
                                                ),
                                              ),
                                              
                                            ],
                                          ), 
                                        ),
                                            ],
                                          ), 
                                        ),
                                        Divider(
                                          height: 5.0,
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
                            Divider(
                              height: 20.0,
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
                  ), 
                  ),);  
                },
              )
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
                color: Colors.grey,
                width: double.infinity,
                height: 180.0,
                child: Image.network(_card, fit: BoxFit.cover),
              ),
              Container(
              //padding: EdgeInsets.only(left:62.0,),
                child: 
                  Text(_data.toUpperCase(),
                    style:TextStyle(
                      fontSize: 15.0,
                      color:Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                  Container(
            margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                //Row with buttons
                Row(
                  children: <Widget>[        
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal:15.0),
                            child:Row(
                              
                              children:<Widget>[
                                Container(
                            //padding: EdgeInsets.only(left: 0.8),
                            //padding: EdgeInsets.only(right: 15.0,left: 13.5,top: 10.0, bottom: 15.0),
                            child: Icon(Icons.favorite_border, size: 24.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                                //Share Button 
                          Container(
                            //padding: EdgeInsets.only(left: 0.8),
                            //padding: EdgeInsets.only(right: 10.0,left: 0.0,top: 10.0, bottom: 15.0),
                            child: Icon(Icons.share, size: 24.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                          
                          Container(
                            //padding: EdgeInsets.only(right: 0.0, left: 110.0, top: 10.0, bottom: 15.0),
                            child: Icon(Icons.more_vert,size: 24.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                          ],
                            ),
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
          ),
          //Buttons Container
        
      ],
    ),
  );
}
}