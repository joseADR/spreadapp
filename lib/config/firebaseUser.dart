import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseUser mCurrentUser;
var documentReference =
    Firestore.instance.collection("users").document(mCurrentUser.uid);

_getCurrentUser() async {
  mCurrentUser = await _auth.currentUser();
  print('Hello'.toString());
  if (mCurrentUser != null) {
    mCurrentUser = mCurrentUser;
  } else {
    print('não logado');
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _getCurrentUser();
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Center(child: Text('Loading...'));
        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return (document['name'])(document['picture'])(document.documentID);
          }).toList(),
        );
      },
    );
  }
}
