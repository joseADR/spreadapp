import 'package:flutter/material.dart';
class FollowPage extends StatelessWidget {
  final String _title;
  final String _promo;
  //String data;
  FollowPage( this._title, this._promo,);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Theme.of(context).primaryColorDark.withOpacity(0.44),
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.7, top: 0.0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
          children:<Widget>[
              //imagem circular do promoter
            GestureDetector(
              onTap: () =>  Navigator.of(context).push(
                MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor:Theme.of(context).primaryColor.withOpacity(0.46),
                        body: NestedScrollView(
                          headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled){
                            return <Widget> [
                              SliverAppBar(
                                textTheme: Theme.of(context).primaryTextTheme,
                                expandedHeight: 180.0,
                                elevation: 1.0,
                                pinned: true,
                                floating: false,
                                forceElevated: innerboxIsScrolled,
                                title: null,
                                flexibleSpace: FlexibleSpaceBar(
                                  centerTitle: false,
                                  background: Image.network(_promo,
                                  fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ];
                          },
                          body: ListView(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children:<Widget>[
                                    Container(
                                      width: 350.0,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 110.0,
                                            height: 110.0,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  _promo),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(Radius.circular(75.0)),
                                              boxShadow: [
                                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 45.0),
                                          Text(
                                            'Birubiruduleibi',
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _title,
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          SizedBox(height: 25.0),
                                          Container(
                                            height: 30.0,
                                            width: 95.0,
                                            child: Material(
                                              borderRadius: BorderRadius.circular(20.0),
                                              shadowColor: Colors.greenAccent,
                                              color: Colors.blue,
                                              elevation: 5.0,
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Center(
                                                  child: Text(
                                                    'Seguir',
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 25.0),
                                          Container(
                                            height: 30.0,
                                            width: 95.0,
                                            child: Material(
                                              borderRadius: BorderRadius.circular(20.0),
                                              shadowColor: Colors.transparent,
                                              color: Colors.transparent,
                                              elevation: 5.0,
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Center(
                                                  child: Text(
                                                    'Log out',
                                                    style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.1, 0.5, 0.7, 0.9],
                                    colors:[
                                      Colors.black54,
                                      Colors.black54,
                                      Colors.black45,
                                      Colors.black12,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                child: Card(
                  child:Row(
                    children:<Widget>[
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                              _promo),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
