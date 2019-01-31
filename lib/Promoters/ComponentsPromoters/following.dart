import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spreadapp/Promoters/profile.dart';
import 'package:spreadapp/main.dart';

class FollowingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8.3,
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(mCurrentUser.uid)
            .collection('Following')
            .getDocuments()
            .asStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new Center(child: CircularProgressIndicator());
          return new Wrap(
            //padding: EdgeInsets.only(top: 1.0),
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 9.3,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 12.1,
                          width: MediaQuery.of(context).size.width / 3.9,
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                    builder: (context) =>
                                        ProfilePage(document.documentID),
                                  ),
                                ),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(document['promoter'],
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(document['name']),
                        ),
                        Material(
                          elevation: 0.0,
                          shadowColor: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.9),
                          color: Theme.of(context).backgroundColor,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    child: RotatedBox(
                                      quarterTurns: 2,
                                      child: Icon(Icons.reply,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              33.0),
                                    ),
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
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
