// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';



// class CategorieList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance
//           .collection('categorias')
//           .getDocuments()
//           .asStream(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return new Center(child: Text('Loading...'));
//         return new ListView(
//           //gridDelegate: ,
//           padding: EdgeInsets.only(top: 1.0),
//           children: snapshot.data.documents.map((DocumentSnapshot document) {
//             return Categories(
//               document.documentID
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
