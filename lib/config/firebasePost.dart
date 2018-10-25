import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
// Firebase pluggin
import '../components/post.dart'; 
import 'package:spreadapp/salvos.dart';
import 'package:spreadapp/seguindo.dart';
//Post Container
class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Center(child:Text('Loading...')); 
        return new ListView(
          padding: EdgeInsets.only(top:6.0),
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return Post(document['title'],document['card'],document['promoter'],document['data']);
          }).toList(),
        );
      },
    );
  }
}
//Página de eventos salvos
class SaveList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Center(child:Text('Loading...')); 
        return new ListView(
          padding: EdgeInsets.only(top:10.0),
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return SavePage(document['title'],document['card'],document['data']);
          }).toList(),
        );
      },
    );
  }
}
//Página de promoters seguidos
class FollowList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Center(child:Text('Loading...')); 
        return new ListView(
          padding: EdgeInsets.only(top:10.0),
          physics: ScrollPhysics(parent: FixedExtentScrollPhysics()),
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return FollowPage(document['title'],document['promoter']);
          }).toList(),
        );
      },
    );
  }
}