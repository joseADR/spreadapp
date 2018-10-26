import 'package:flutter/material.dart';
class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todos os Eventos',
        style: TextStyle(
          fontFamily:'MontSerrat',
          fontSize: 18.0
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.70),
      body: ListView(  
        children: <Widget>[
          //Title and Image
            Card(
              elevation: 1.0,
              color: Theme.of(context).primaryColor.withOpacity(0.20),
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical:12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                //Imagem do evento salvo
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0,horizontal:10.0),   
                  width: 120.0,
                  height: 70.0,
                  child: Image.network(
                    ('http://www.netpetropolis.com.br/sites/arquivos/uploads/2715.jpg'), 
                    fit: BoxFit.cover,
                  ),
                ),
                //Titulo
                Container(
                  padding: EdgeInsets.only(right:20.0),
                  child:Column(
                    children: <Widget>[
                      Text(
                        'titulo do evento'.toUpperCase(),
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
                        'data do evento'.toUpperCase(),
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
              ],
            ),
          ),
        ], 
      ),
    );
  }
}
