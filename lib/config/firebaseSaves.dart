import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:spreadapp/components/cardinfo.dart';


class SavesList extends StatefulWidget {
  @override 
  _SavesListState createState() => _SavesListState();
}

class _SavesListState extends State<SavesList> {

  List<String> _savedPosts = [];

  Future<List<String>> getSavedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('ids');
  }

  Future<Null> removeSavedPrefs(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> aux = _savedPosts;
    aux.remove(id);
    updateState(aux);
    prefs.setStringList('ids',aux);
  }

  void updateState(List<String> list) {
    if(list != null)
      setState(() {
        this._savedPosts = list;
      });
  }

  @override
  void initState() {
    getSavedPrefs().then(updateState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) 
          return Center(child: Text('Loading...'),);
        else {
          //Lista de salvos
          return new ListView(
            padding: EdgeInsets.only(top:10.0),
            children: snapshot.data.documents  
            .where((DocumentSnapshot document) => _savedPosts.contains(document.documentID)) //Busca
            .map((DocumentSnapshot document) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).secondaryHeaderColor,
                      offset: Offset(1.0, 0.7),
                      blurRadius: 5.0
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 10.0, top: 0.0),
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
                        GestureDetector(
                          child: Container(
                            //margin: EdgeInsets.symmetric(vertical: 8.0,horizontal:16.0),   
                            width: 147.0,
                            height: 85.0,
                            child: Image.network(
                              (document['card']), fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () =>  Navigator.of(context).push(
                            MaterialPageRoute<Null>(
                              builder: (BuildContext context) => CardPage(document.documentID),
                            ),
                          ),
                        ),
                        //Titulo
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:50.0),
                          child:Column(
                            children: <Widget>[
                              Text(
                                document['title'].toUpperCase(),
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
                                document['data'].toUpperCase(),
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
                                  GestureDetector(
                                    child: Container(
                                      child: Icon(Icons.remove_circle, size: 22.0), 
                                      //color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                                    ),
                                    onTap: () {removeSavedPrefs(document.documentID);},
                                  ),
                                  //Share Button 
                                  Container(
                                    margin: const EdgeInsets.only(top:15.0,right:6.0),
                                    child: Icon(
                                      Icons.share, size: 22.0
                                      //color: Theme.of(context).iconTheme.color.withOpacity(0.7)
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
            }).toList()
          );
        }
      },
    );
  }
}









