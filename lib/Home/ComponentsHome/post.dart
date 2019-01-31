import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spreadapp/Home/ComponentsHome/cardinfo.dart';
import 'package:spreadapp/Promoters/profile.dart';

class Post extends StatefulWidget {
  _PostState createState() => _PostState();
  Post(this.title, this.card, this.promo, this.data, this.id);
  final String title;
  final String card;
  final String promo;
  final String data;
  final String id;
}

class _PostState extends State<Post> {
  SnackBar snackBar() {
    return SnackBar(
        duration: Duration(seconds: 1),
        content: Text(widget.title + ' adicionado aos salvos'),
        action: SnackBarAction(
          label: 'DESFAZER',
          onPressed: () {
            // Some code to undo the change!
          },
        ));
  }

  Future<bool> addSavedPrefs(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> aux;
    aux = prefs.getStringList('ids') ?? [];
    if (!aux.contains(id)) aux.add(id);
    prefs.setStringList('ids', aux);
    return prefs.commit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Theme.of(context).backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Theme.of(context).secondaryHeaderColor,
                offset: Offset(.0, 0.0),
                blurRadius: 1.5),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: .0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Title and Image
            Row(
              children: <Widget>[
                //Perfil Circle Image
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<Null>(
                          builder: (BuildContext context) =>
                              ProfilePage(widget.id),
                        ),
                      ),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.promo),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.0,
                ),
                //Title container
                Expanded(
                  child: Text(
                    widget.title.toUpperCase(),
                    style: Theme.of(context).textTheme.title,
                    textScaleFactor: .5,
                  ),
                ),
              ],
            ),
            //Container for image
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<Null>(
                      builder: (BuildContext context) => CardPage(widget.id),
                    ),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.0),
                    //color: Theme.of(context).secondaryHeaderColor,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.2,
                    child: Hero(
                        tag: widget.card,
                        child: Image.network(widget.card, fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
            Material(
              color: Theme.of(context).backgroundColor,
              child: Container(
                //margin: EdgeInsets.symmetric(horizontal:.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          //Save Button
                          IconButton(
                            splashColor: null,
                            onPressed: () {
                              addSavedPrefs(widget.id);
                              Scaffold.of(context).showSnackBar(snackBar());
                            },
                            icon:
                                //color: Colors.transparent,
                                //padding: EdgeInsets.only(right: 0.0,left: 0.0,bottom: 6.0,top: 3.0),
                                Icon(Icons.favorite_border,
                                    size: MediaQuery.of(context).size.height /
                                        33.0),
                            // color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                          ),
                          //Share Button
                          IconButton(
                            splashColor: null,
                            onPressed: () {},
                            icon: Container(
                              //padding: EdgeInsets.only(left: 0.8),
                              //padding: EdgeInsets.only(bottom: 6.0,top: 3.0),
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Icon(Icons.reply,
                                    size: MediaQuery.of(context).size.height /
                                        33.0),
                              ),
                            ),
                          ),
                          // color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                        ],
                      ),
                    ),
                    SizedBox(),
                    Container(
                      padding: EdgeInsets.only(right: 72.0),
                      child: Text(
                        widget.data.toUpperCase(),
                        textScaleFactor: .85,
                        style: TextStyle(
                          color: Color(0xffec0000),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MontSerrat',
                        ),
                      ),
                    ),
                    SizedBox(),
                    Container(
                      //padding: EdgeInsets.only(left: 5.0,top: .0),
                      child: Icon(Icons.more_vert,
                          size: MediaQuery.of(context).size.height /
                              33.0), // color: Theme.of(context).iconTheme.color.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
