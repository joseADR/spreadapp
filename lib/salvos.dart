import 'package:flutter/material.dart';
class SavePage extends StatelessWidget {
  String title;
  String data;
  SavePage(title) {
    this.title = title;
  }
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
                margin: EdgeInsets.only(left: 6.0,top:8.0,bottom: 9.0),   
                width: 150.0,
                height: 95.0,
                child: Image.network(
                  'http://www.afortunadas.com.br/wp-content/uploads/2017/06/festival_de_fries_ribeirao_preto_1200x635px_0-1160x635.jpg',
                  fit: BoxFit.fill,
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
                ('20/OUT'),
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
                          child: Icon(Icons.share, size: 22.0, 
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
