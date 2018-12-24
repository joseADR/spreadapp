import 'package:flutter/material.dart';
import '../components/seguindo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Página de promoters seguidos
class FollowList extends StatefulWidget {
  _FollowListState createState() => _FollowListState();
}

TextEditingController controller = TextEditingController();

class _FollowListState extends State<FollowList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.1),
                borderRadius: BorderRadius.circular(15.0)),
            color: Theme.of(context).backgroundColor,
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            elevation: 0.0,
            child: ListTile(
              leading: Icon(Icons.search),
              title: TextField(
                controller: controller,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Buscar em Promoters',
                    hintStyle: TextStyle(fontSize: 14.0)),
              ),
            ),
          ),
          Container(
            child: Text('Sugeridos',
            style: Theme.of(context).textTheme.title,
            textScaleFactor: 0.6,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height /8.3,
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('promoters').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return new Center(child: Text('Loading...'));
                return new ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(top: 1.0),
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return FollowPage(document['nome'], document['promoter'],
                        document.documentID);
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
            height: MediaQuery.of(context).size.height / 12.0,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Tab(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.people,
                          size: 20.0,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Text('Seguindo'),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.notifications,
                          size: 20.0,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Text('Notificações'),
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
