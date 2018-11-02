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
        label: 'Desfazer',
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
      elevation: 0.1,
      color: Theme.of(context).primaryColor,//.withOpacity(0.9),
      margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 3.0),
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
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  width: 22.0,
                  height: 22.0,
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
                margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                color: Colors.grey,
                width: double.infinity,
                height: 185.0,
                child: Image.network(_card, fit: BoxFit.cover)
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal:8.0, vertical: 3.0),
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
                        padding: EdgeInsets.only(right: 8.0,left: 3.0,bottom: 6.0,top: 3.0),
                        child: Icon(Icons.favorite_border, size: 24.0),// color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                      )
                    ),
                    //Share Button 
                    Container(
                      //padding: EdgeInsets.only(left: 0.8),
                      padding: EdgeInsets.only(bottom: 6.0,top: 3.0),
                      child: RotatedBox(
                        quarterTurns: 2,
                        child:Icon(Icons.reply, size: 24.0), 
                      ), 
                    ),
                      // color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                  ],
                ),
              ),
              SizedBox(),
              Container(
                padding: EdgeInsets.only(right:28.0,bottom: 6.0),
                child: 
                  Text(_data.toUpperCase(),
                    style:TextStyle(
                      fontSize: 15.7,
                      color:Color(0xffec0000),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MontSerrat',
                    ),
                  ),
              ),
              SizedBox(),
              Container(
                padding: EdgeInsets.only(left: 5.0,bottom: 6.0,top: 3.0),
                child: Icon(Icons.more_vert,size: 24.0),// color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}