import 'package:flutter/material.dart';

class FollowersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Seguidores',
        style: TextStyle(
          fontFamily:'MontSerrat',
          fontSize: 18.0),
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
      body:ListView(
       children:<Widget>[
         Card(
           elevation: 1.0,
           color: Theme.of(context).primaryColor.withOpacity(0.20),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                  //imagem circular do promoter
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 15.0),
                      child:Row(
                        children:<Widget>[
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://cinema10.com.br/upload/filmes/filmes_11871_chap12.jpg'),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(child: Row(
                        children: <Widget> [
                          Container(
                            padding: EdgeInsets.only(left:40.0),
                            child: Text('Fulano de Tal',
                            style: TextStyle(
                              fontFamily:'MontSerrat',
                              fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
