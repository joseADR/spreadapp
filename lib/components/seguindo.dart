import 'package:flutter/material.dart';
import 'package:spreadapp/profile.dart';

class FollowPage extends StatelessWidget {
  final String _nome;
  final String _promo;
  final String _id;
  //String data;
  FollowPage(this._nome, this._promo, this._id);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      //color: Theme.of(context).primaryColorDark.withOpacity(0.20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //imagem circular do promoter
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                    builder: (context) => ProfilePage(_id),
                  ),
                ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(_promo), fit: BoxFit.cover),
                boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.black)],
              ),
            ),
          ),
          //Container(
          //  child: Row(
          //    children: <Widget>[
          //      Container(
          //        child: Text(
          //          _nome,
          //          style: TextStyle(
          //            fontFamily: 'MontSerrat',
          //            fontSize: 15.0,
          //          ),
          //        ),
          //      ),
          //    ],
          //  ),
          //),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //children: <Widget>[
              //  //remover evento salvo
              //  Container(
              //    child: Icon(Icons.remove_circle,
              //        size: 22.0,
              //        color:
              //            Theme.of(context).iconTheme.color.withOpacity(0.7)),
              //  ),
              //  //Share Button
              //  Container(
              //    margin: const EdgeInsets.only(top: 15.0, right: 6.0),
              //    child: Icon(Icons.share,
              //        size: 22.0,
              //        color:
              //            Theme.of(context).iconTheme.color.withOpacity(0.7)),
              //  ),
              //],
            ),
          ),
        ],
      ),
    );
  }
}
