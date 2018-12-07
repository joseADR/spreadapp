import 'package:flutter/material.dart';
import '../components/seguindo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Página de promoters seguidos
class FollowList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('promoters').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Center(child: Text('Loading...'));
        return new ListView(
          padding: EdgeInsets.only(top: 1.0),
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return FollowPage(
                document['nome'], document['promoter'], document.documentID);
          }).toList(),
        );
      },
    );
  }
}
