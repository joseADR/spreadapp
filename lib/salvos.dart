import 'package:flutter/material.dart';
class SavePage extends StatelessWidget {
  final String title;
  final String _promo;
  final String _data;
  SavePage( this.title, this._promo, this._data);
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: Theme.of(context).primaryColorDark.withOpacity(0.54),
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.7, top: 0.0),
      child: Column(
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Title and Image
          Row(
            children:<Widget>[
              //Imagem do evento salvo
              Container(
                margin: EdgeInsets.only(left: 8.0,top:8.0,bottom: 8.0),   
                width: 147.0,
                height: 85.0,
                child: Image.network(
                  (_promo), fit: BoxFit.cover,
                ),
              ),
              //Titulo
              Container(
                margin: EdgeInsets.only(left:70.0),
                child:Column(
                  children: <Widget>[
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
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
                        fontWeight: FontWeight.normal
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
        ],
      ),
    );
  }
}
