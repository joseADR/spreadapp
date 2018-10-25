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
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    backgroundColor:Theme.of(context).primaryColor.withOpacity(0.5),
                      body: NestedScrollView(
                         headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled){
                          return <Widget> [
                            SliverAppBar(
                              textTheme: Theme.of(context).primaryTextTheme,
                              expandedHeight: 220.0,
                              elevation: 1.0,
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
                            ),
                          ];
                        },
                      body: ListView(
                        children:<Widget>[
                          Container(
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(_title.toUpperCase(),
                                style:TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontFamily: 'MontSerrat',
                                  ),
                                ),
                              ],
                            ), 
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget>[
                                IconButton(
                                  color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                                  icon:Icon(Icons.thumb_up),
                                  onPressed: null,
                                ),
                                IconButton(
                                  color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                                  icon:Icon(Icons.check_circle_outline),
                                  onPressed: null,
                                ),
                                IconButton(
                                  color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                                  icon:Icon(Icons.favorite_border),
                                  onPressed: null,
                                ),
                                IconButton(
                                  color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                                  icon:Icon(Icons.share),
                                  onPressed: null,
                                ),
                              ]
                            ),
                          ),
                          Divider(color: Colors.white30,),
                          Container(
                          margin: EdgeInsets.symmetric(horizontal:10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:10.0),
                                      child: 
                                      Text(
                                        'Descrição',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'MontSerrat',
                                        ),
                                      ),
                                    ),
                                   Text(_data.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MontSerrat',
                                      fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal:10.0),
                                child: Text(
                                  'A única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério. É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.',
                                  style: TextStyle(
                                    fontFamily: 'MontSerrat',
                                  ),
                                ),
                              ),
                              Divider(
                                height: 20.0,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children:<Widget>[       
                                          Container(
                                            padding: EdgeInsets.only(right:10.0),
                                            child:
                                              Icon(Icons.location_on),
                                              ),
                                          Container(
                                            child:Text(_local,
                                              style:TextStyle(
                                              fontSize: 12.5,
                                              fontFamily: 'MontSerrat',
                                              )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children:<Widget>[
                                          Container(
                                            padding: EdgeInsets.only(right:10.0),
                                            child:Icon(Icons.timer),
                                          ),
                                          Container(
                                            child:Text('Início 13:50 Término 18:30',
                                            style: TextStyle(
                                              fontFamily: 'MontSerrat',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],    
                    ),
                  ),
                );  
              },
            ),
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
                      fontSize: 16.0,
                      color:Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MontSerrat',
                    ),
                  ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child:Row(
                        children:<Widget>[
                          Container(
                          padding: EdgeInsets.only(right: 10.0,left: 6.0,bottom: 10.0),
                          child: Icon(Icons.favorite_border, size: 23.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                      //Share Button 
                          Container(
                            //padding: EdgeInsets.only(left: 0.8),
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Icon(Icons.share, size: 23.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.0,bottom: 10.0),
                      child: Icon(Icons.more_vert,size: 23.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                    ),
                  ],
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