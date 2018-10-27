import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import '../components/saved.dart';
import 'dart:async';


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

  Future<bool> addSavedPrefs(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> aux = _savedPosts;
    aux.add(id);
    updateState(aux);
    prefs.setStringList('ids',aux);
    return prefs.commit();
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
          return new ListView(
            padding: EdgeInsets.only(top:10.0),
            physics: ScrollPhysics(parent: FixedExtentScrollPhysics()),
            children: snapshot.data.documents    
            .map((DocumentSnapshot document) {
              if(_savedPosts.contains(document.documentID))
                return SavedPost(document['title'],document['promoter'],document['data']);
            }).toList()
          );
        }
      },
    );
  }
}









