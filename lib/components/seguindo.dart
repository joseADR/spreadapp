import 'package:flutter/material.dart';
import 'package:spreadapp/profile.dart';
class FollowPage extends StatelessWidget {
  final String _title;
  final String _promo;
  //String data;
  FollowPage( this._title, this._promo,);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      //color: Theme.of(context).primaryColorDark.withOpacity(0.20),
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.7, top: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>[
              //imagem circular do promoter
              Container(
                padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 15.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget>[
                    GestureDetector(
                      onTap: () =>  Navigator.of(context).push(
                        MaterialPageRoute<Null>(
                          builder: (context) => ProfilePage(),
                          ),
                        ),
                      child:Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              _promo),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(blurRadius: 3.0, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Container(
                      child: Text('Promoter',
                      style: TextStyle(
                        fontFamily:'MontSerrat',
                        fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal:10.0,vertical:10.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    //remover evento salvo
                    Container(
                      child: Icon(Icons.remove_circle, size: 22.0, 
                      color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                    ),
                    //Share Button 
                    Container(
                      margin: const EdgeInsets.only(top:15.0,right:6.0),
                      child: Icon(
                        Icons.share, size: 22.0, 
                        color: Theme.of(context).iconTheme.color.withOpacity(0.7)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
