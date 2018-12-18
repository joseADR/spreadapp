import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spreadapp/components/cardinfo.dart';
import 'package:spreadapp/config/theme.dart' as Temas;
import 'package:spreadapp/main.dart';

class DataSearch extends SearchDelegate<String> {
  get ids => Firestore.instance.collection('posts').snapshots();
  bool lightThemeEnabled = true;
  @override
  List<Widget> buildActions(BuildContext context) {
    MaterialApp(
        theme: lightThemeEnabled ? Temas.SpreadLight : Temas.SpreadDark,
        home: HomePage(''));

    //actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {});
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('posts')
            .where('title', isEqualTo: query)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: Text(''));
          else {
            //Lista de salvos
            return new ListView(
                padding: EdgeInsets.only(top: 3.5),
                children: snapshot.data.documents
                    //.where((DocumentSnapshot document) => _savedPosts.contains(document.documentID)) //Busca
                    .map((DocumentSnapshot document) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      //color: Theme.of(context).backgroundColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            //color: Theme.of(context).secondaryHeaderColor,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 3.0),
                      ],
                    ),
                    margin: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 10.0, top: 0.0),
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Title and Image
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //Imagem do evento salvo
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            NetworkImage((document['card']))),
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  width: 134.0,
                                  height: 80.0,
                                ),
                                onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute<Null>(
                                        builder: (BuildContext context) =>
                                            CardPage(document.documentID),
                                      ),
                                    ),
                              ),
                              //Titulo
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal:50.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      document['title'].toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: 'MontSerrat',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    //espaço entre o título e a data
                                    Divider(
                                      height: 5.0,
                                    ),
                                    Text(
                                      document['data'].toUpperCase(),
                                      style: TextStyle(
                                        //color: Theme.of(context).iconTheme.color.withOpacity(.5),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'MontSerrat',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //icones de remoção e de compartilhamento
                              Material(
                                elevation: 0.8,
                                //shadowColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.9),
                                //color: Theme.of(context).backgroundColor,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      child: Column(
                                        children: <Widget>[
                                          //remover evento salvo
                                          IconButton(
                                            onPressed: () {},
                                            icon: Container(
                                              height: 10.0,
                                              child: Icon(Icons.remove_circle,
                                                  size: 20.0),
                                              //color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                                            ),
                                            //onPressed: () {removeSavedPrefs(document.documentID);},
                                          ),
                                          //Share Button
                                          IconButton(
                                            onPressed: () {},
                                            //margin: const EdgeInsets.only(top:15.0,right:6.0),
                                            icon: Container(
                                              //height: 10.0,
                                              child: Icon(Icons.share,
                                                  size: 20.0
                                                  //color: Theme.of(context).iconTheme.color.withOpacity(0.7)
                                                  ),
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
                        ),
                      ],
                    ),
                  );
                }).toList());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone search for something
    return RichText(
      text: TextSpan(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}
