import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase pluggin

import '../components/post.dart'; //Post Container

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Center(child:Text('Loading...'));
        return new ListView(
          padding: EdgeInsets.only(top: 12.0),
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return Post(document['title'],document['card'],document['promoter']);
          }).toList(),
        );
      },
    );
  }
}