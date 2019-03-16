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
  List<String> _savedPosts;

  SnackBar snackBar() {
    return SnackBar(
        duration: Duration(seconds: 1),
        content: Text(widget.title + ' adicionado aos salvos'),
        action: SnackBarAction(
          label: 'DESFAZER',
          onPressed: () {
            removeSavedPrefs(widget.id);
            Scaffold.of(context).showSnackBar(removedSnackBar());
          },
        ));
  }

  SnackBar removedSnackBar() {
    return SnackBar(
        duration: Duration(seconds: 1),
        content: Text(widget.title + ' removido dos salvos'),
        action: SnackBarAction(
          label: 'DESFAZER',
          onPressed: () {
            addSavedPrefs(widget.id);
            Scaffold.of(context).showSnackBar(snackBar());
          },
        ));
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSaveValue();
  }

  bool heartColor = false;

  _loadSaveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      heartColor = (prefs.getBool('heartColor')) ?? false;
    });
  }

  _buttonSave() {
    setState(() {
      heartColor = true;
    });
    _savenSaveValue();
  }

  _buttonUnSave() {
    setState(() {
      heartColor = false;
    });
    _savenSaveValue();
  }

  _savenSaveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('heartColor', heartColor);
    });
  }

  Future<bool> addSavedPrefs(String id) async {
    _buttonSave();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> aux;
    aux = prefs.getStringList('ids') ?? [];
    if (!aux.contains(id)) aux.add(id);
    prefs.setStringList('ids', aux);
    return prefs.commit();
  }

  Future<Null> removeSavedPrefs(String id) async {
    _buttonUnSave();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> aux = _savedPosts;
    aux.remove(id);
    updateState(aux);
    prefs.setStringList('ids', aux);
    
  }

  void updateState(List<String> list) {
    if (list != null)
      setState(() {
        this._savedPosts = list;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        height: MediaQuery.of(context).size.height / 2.28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Theme.of(context).backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
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
                          heartColor
                              ? IconButton(
                                  splashColor: null,
                                  onPressed: () {
                                    removeSavedPrefs(widget.id);
                                    Scaffold.of(context)
                                        .showSnackBar(removedSnackBar());
                                  },
                                  icon: Icon(Icons.favorite,
                                      color: Colors.blue,
                                      size: MediaQuery.of(context).size.height /
                                          35.0))
                              : IconButton(
                                  splashColor: null,
                                  onPressed: () {
                                    addSavedPrefs(widget.id);
                                    Scaffold.of(context)
                                        .showSnackBar(snackBar());
                                  },
                                  icon: Icon(Icons.favorite_border,
                                      size: MediaQuery.of(context).size.height /
                                          33.0)),
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
                                          35.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(),
                    Container(
                      padding: EdgeInsets.only(right: 52.0),
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
                    IconButton(
                      splashColor: null,
                      onPressed: () {},
                      icon: Container(
                        //padding: EdgeInsets.only(left: 0.8),
                        //padding: EdgeInsets.only(bottom: 6.0,top: 3.0),
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(Icons.more_vert,
                              size: MediaQuery.of(context).size.height / 35.0),
                        ),
                      ),
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
