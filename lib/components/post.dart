import 'package:flutter/material.dart';
import 'package:spreadapp/components/cardinfo.dart';
import 'package:spreadapp/profile.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Post extends StatelessWidget {
  Post( this._title, this._card, this._promo, this._data, this._id );
  final String _title;
  final String _card;
  final String _promo; 
  final String _data;
  final String _id;

  SnackBar snackBar() {
    return SnackBar(
      duration: Duration(seconds: 1),
      content: Text(_title + ' adicionado aos salvos'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change!
        },
      )
    );
  }

  Future<bool> addSavedPrefs(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> aux;
    aux = prefs.getStringList('ids')?? [];
    if(!aux.contains(id))
      aux.add(id);
    prefs.setStringList('ids',aux);
    return prefs.commit();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Theme.of(context).primaryColorDark.withOpacity(0.30),
      margin: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 3.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Title and Image
          Row(
            children:<Widget>[
              //Perfil Circle Image
              GestureDetector(
                onTap:() => Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                    builder: (BuildContext context) => ProfilePage(),
                    ),
                  ),
                child:Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_promo),
                    ),
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
                builder: (BuildContext context) => CardPage(),
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
                child: Image.network(_card, fit: BoxFit.cover)
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal:8.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[ 
              Container(
                child:Row(
                  children:<Widget>[
                    //Save Button
                    GestureDetector(
                      onTap: () { 
                        addSavedPrefs(_id);
                        Scaffold.of(context).showSnackBar(snackBar());
                      },
                      child:Container(
                        padding: EdgeInsets.only(right: 10.0,left: 6.0,bottom: 10.0),
                        child: Icon(Icons.favorite_border, size: 23.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                      )
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
              SizedBox(),
              Container(
                padding: EdgeInsets.only(right:33.0,bottom: 5.0),
                child: 
                  Text(_data.toUpperCase(),
                    style:TextStyle(
                      fontSize: 15.0,
                      color:Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MontSerrat',
                    ),
                  ),
              ),
              SizedBox(),
              Container(
                padding: EdgeInsets.only(left: 5.0,bottom: 10.0),
                child: Icon(Icons.more_vert,size: 23.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}