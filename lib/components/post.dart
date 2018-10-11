import 'package:flutter/material.dart';
class Post extends StatelessWidget {
  final String title;
  final String _img;
  final String _promo; 
  final String date;
  Post( this.title, this.date, this._promo, this._img);
  @override
  Widget build(BuildContext context) {
    return 
    Card(
      color: Theme.of(context).primaryColorDark.withOpacity(0.44),
      margin: const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 5.0, top: 0.0),
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
                    fit: BoxFit.fill,
                    image: NetworkImage(_promo),
                  ),
                ),
              ),
              //Title container
              Expanded(
                child: Text(
                  title.toUpperCase(),
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
            onTap: null,
            child:
              Container(
                margin: EdgeInsets.only(left: 2.0, right: 2.0, top: 1.0,bottom: 1.0),
                color: Color.fromRGBO(200,200,200,.5),
                width: double.infinity,
                height: 180.0,
                child: Image.network(
                  _img,
                  fit: BoxFit.cover,
                ),
              ),
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
                                  Text(date.toUpperCase(),style:TextStyle(
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
