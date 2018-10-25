import 'package:flutter/material.dart';
class SavePage extends StatelessWidget {
  final String title;
  final String _promo;
  final String _data;
  SavePage( this.title, this._promo, this._data);
  @override
  Widget build(BuildContext context) {
    return 
    Card(
      elevation: 0.5,
      color: Theme.of(context).primaryColorDark.withOpacity(0.3),
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.7, top: 0.0),
      child: Column(
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Title and Image
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0,vertical:12.0),
            child: Row(
            children:<Widget>[
              //Imagem do evento salvo
              Container(
                //margin: EdgeInsets.symmetric(vertical: 8.0,horizontal:16.0),   
                width: 147.0,
                height: 85.0,
                child: Image.network(
                  (_promo), fit: BoxFit.cover,
                ),
              ),
              //Titulo
              Container(
                margin: EdgeInsets.symmetric(horizontal:50.0),
                child:Column(
                  children: <Widget>[
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'MontSerrat',
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    //espaço entre o título e a data
                    Divider(
                      height: 5.0,
                    ),
                    Text(
                      _data.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color.withOpacity(.5),
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'MontSerrat',
                      ),
                    ),      
                  ],
                ),
              ),
              //icones de remoção e de compartilhamento
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
