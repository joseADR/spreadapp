import 'package:flutter/material.dart';

class Post extends StatelessWidget {

  String _title;

  Post(String title) {
    this._title = title;
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.3),
      margin: const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 12.0, top: 0.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children:<Widget>[
              //Perfil Circle Image
              Container(
                //margin: EdgeInsets.only(top: 0.0, right: 0.0, left: 18.0, bottom: 15.0),
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("http://1.bp.blogspot.com/-bdhuDXmNZdc/TZZDxXGvXnI/AAAAAAAAAJM/ClB1rJ_zVeQ/s1600/skol.png"),
                  ),
                ),
              ),
              //Title container
              Expanded(
                flex: 2,
                //padding: EdgeInsets.only(left: 6.0),
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
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0, top: 2.0),
            color: Color.fromRGBO(200,200,200,.5),
            width: double.infinity,
            height: 180.0,
            child: Image.network(
              'http://www.afortunadas.com.br/wp-content/uploads/2017/06/festival_de_fries_ribeirao_preto_1200x635px_0-1160x635.jpg',
              fit: BoxFit.fill,
            ),
          ),
          //Container with title and buttons
          Container(
            margin: EdgeInsets.only(top: 0.0),
            child: Column(
              children: <Widget> [
                //Row with buttons
                Row(
                  children: <Widget>[        
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,          
                        children: <Widget> [
                          Container(
                            //padding: EdgeInsets.only(left: 0.8),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  //padding: EdgeInsets.only(right: 10.0,left: 58.5,top: 5.0, bottom: 10.0),
                                  child: Icon(Icons.favorite_border, size: 20.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        //Share Button
                          Container(
                            //padding: EdgeInsets.only(right: 0.0, left: 8.0, top: 5.0, bottom: 10.0),
                            child: Icon(Icons.share, size: 20.0, color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),  
                      //Find More
                  ],
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}