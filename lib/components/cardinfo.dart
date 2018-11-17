import 'dart:async';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/camera_position.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spreadapp/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
const api_key ="AIzaSyDQIQ6TK-F0NCvvVvx-eaeqPVUL1K0ClPE";
class CardPage extends StatefulWidget {
  //Construtor para o id
  CardPage(this.id);
  final String id;
  @override
  _CardState createState() => _CardState(id);
}
class _CardState extends State<CardPage> {
  _CardState(this._id);

  String _id;
  String _title = '';
  String _description = '';
  String _promo = '';
  String _data = '';
  String _card = '';
  String _local = '';

  SnackBar snackBar() {
    return SnackBar(
      duration: Duration(seconds: 1),
      content: Text(_title.toUpperCase() + ' adicionado aos salvos'),
      action: SnackBarAction(
        label: 'DESFAZER',
        onPressed: () {
          // Some code to undo the change!
        },
      )
    );
  }
  //Maps
  MapView mapView = MapView();
  var staticMapProvider = StaticMapProvider(api_key);
  CameraPosition cameraPosition;
  Uri staticMapUri;
  showMap(){
    mapView.show(
      MapOptions(
        hideToolbar: false,
        showMyLocationButton: false,
        title: "Spread",
        mapViewType: MapViewType.normal,
        initialCameraPosition: CameraPosition(Location(-22.506592, -43.185093), 15.0),
        showUserLocation: true
      ),
    );
  }
  Future<bool> addSavedPrefs(String id) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> aux;
      aux = prefs.getStringList('ids')?? [];
      if(!aux.contains(id))
        aux.add(id);
      prefs.setStringList('ids',aux);
      return prefs.commit();
    }
  @override
  void initState(){
    
    super.initState();
    Firestore.instance.collection('posts').document(_id).get().then((data) {
        setState(() {
          this._description = data['description'];
          this._card = data['card'];
          this._promo = data['promoter'];
          this._title = data['title'];
          this._data = data['data'];
          this._local = data['local'];     
        });
    });
    cameraPosition = CameraPosition(Location(-22.506592, -43.185093), 15.0);
    staticMapUri = staticMapProvider.getStaticUri(
      Location(-22.506592, -43.185093), 15,
      height: 400, width: 900, mapType: StaticMapViewType.roadmap
    );  
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled){
            return <Widget> [
              SliverAppBar(
                textTheme: Theme.of(context).primaryTextTheme,
                expandedHeight: 190.0,
                elevation: 1.0,
                pinned: true,
                floating: false,
                forceElevated: innerboxIsScrolled,
                title: null,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Image.network(_card,
                  fit: BoxFit.fill,
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children:<Widget>[
              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_title.toUpperCase(),
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontFamily: 'MontSerrat',
                      fontSize: 16.0
                      ),
                    ),
                  ],
                ), 
              ),
              SizedBox(
                height: 13.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 12.0,
                                ),
                                IconButton(
                                  color: Theme.of(context).iconTheme.color,
                                  icon:Icon(Icons.thumb_up,size: 27.0,),
                                  onPressed: (){},
                                ),
                                Text('958',
                                  style: TextStyle(
                                    color: Theme.of(context).iconTheme.color,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                             child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 12.0,), 
                                IconButton(
                                  color: Theme.of(context).iconTheme.color,
                                  icon:Icon(Icons.check_circle_outline,size: 27.0),
                                  onPressed: (){},
                                ),
                                Text('eu vou!',
                                  style: TextStyle(
                                    color: Theme.of(context).iconTheme.color,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),   
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 12.0,
                                ),
                                IconButton(
                                  color: Theme.of(context).iconTheme.color,
                                  icon:Icon(Icons.favorite_border,size: 27.0),
                                  onPressed: (){
                                    addSavedPrefs(_id);
                                    Scaffold.of(context).showSnackBar(snackBar());
                                  },
                                ),
                                Text('salvar',
                                  style: TextStyle(
                                    color: Theme.of(context).iconTheme.color,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 12.0,
                                ),
                                IconButton(
                                  color: Theme.of(context).iconTheme.color,
                                  icon:Icon(Icons.share, size: 27.0,),
                                  onPressed: (){},
                                ),
                                Text('compartilhar',
                                  style: TextStyle(
                                    color: Theme.of(context).iconTheme.color,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
              SizedBox(height: 45.0),
              Divider(color: Theme.of(context).dividerColor,
              height: 0.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor.withOpacity(0.15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container( 
                      padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 0.0),
                      child:Row(
                        children:<Widget>[
                          GestureDetector(
                            onTap: () =>  Navigator.of(context).push(
                              MaterialPageRoute<Null>(
                                builder: (context) => ProfilePage(_id),
                              ),
                            ),
                            child:Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    _promo),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(blurRadius: 3.0, color: Colors.black)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: <Widget>[
                          Text('Bohemia',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                            ),  
                          ),
                          Text('Promoter',
                            style: TextStyle(
                              fontSize: 11.0
                            ),
                          ),
                        ],
                      ),
                    ), 
                    Container(
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        child: Text('SEGUIR',
                          style: TextStyle(
                            color: Theme.of(context).buttonColor,
                            ),
                          ),
                        disabledBorderColor: Theme.of(context).buttonColor,
                        highlightedBorderColor: Theme.of(context).buttonColor,
                        highlightColor: Theme.of(context).buttonColor,
                        splashColor: Colors.blue,
                        borderSide: BorderSide(
                          color: Theme.of(context).buttonColor,
                        ),
                        onPressed: () {}, 
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Theme.of(context).dividerColor,
              height: 0.0,),
              Container(
              margin: EdgeInsets.symmetric(horizontal:10.0,vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical:12.0),
                          child: 
                          Text(
                            'Descrição',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MontSerrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(_description ,
                            style: TextStyle(
                            fontFamily: 'MontSerrat',
                            fontSize: 15.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Container(
                    child: FittedBox(
                      //direction: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget>[
                                      Container(
                                        padding: EdgeInsets.only(right:10.0),
                                        child:Icon(Icons.timer),
                                      ),
                                      Container(
                                        child:Text('De 13:50 até 18:30',
                                        style: TextStyle(
                                          fontFamily: 'MontSerrat',
                                          fontSize: 16.0
                                          ),
                                        ),
                                      ), 
                                      SizedBox(width: 50.0),
                                      Container(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.calendar_today),
                                      ),
                                      Container(
                                        child: Text('Data',
                                        style: TextStyle(
                                          fontSize: 16.0
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Container(
                                        child: Text(_data.toUpperCase(),
                                          style: TextStyle(
                                            color: Color(0xffec0000),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'MontSerrat',
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ), 
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(right:10.0),
                                      child:
                                        Icon(Icons.location_on
                                      ),
                                    ),
                                    Text(_local,
                                      style:TextStyle(
                                      fontFamily: 'MontSerrat',
                                      fontSize: 15.0
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    height: 20.0,
                    color: Theme.of(context).dividerColor,
                  ),
                  Container(
                    child: Column(
                      children:<Widget>[
                        Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget>[
                              Text(
                                'Como Chegar',
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0
                                ),
                              ),
                              SizedBox(width:10.0),
                              Icon(Icons.arrow_drop_down_circle
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Theme.of(context).secondaryHeaderColor,
                                offset: Offset(0.1, 0.6),
                                blurRadius: 5.0
                              ),
                            ],
                          ),
                          child: InkWell(
                            child:Image.network(staticMapUri.toString()),
                            onTap: showMap,
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10.0,
              color: Theme.of(context).dividerColor,
            ),
            SizedBox(height: 20.0),
            Center(child: Text('Quem vai ?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(child: 
              Container(
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index){
                    return _buildFriends(index);
                  },
                ),
              )
            ),
            SizedBox(height: 0.0),
            Container(child:
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 13.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text('Ver todos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),  
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              color: Theme.of(context).backgroundColor.withOpacity(0.1),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text('Mais eventos como este',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                      ),
                    ),
                  ), 
                ],
              ),
            ),
            //SizedBox(height: 20.0,),
            Center(child:
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
                      height: 175.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index){
                          return _buildMoreEvents(index);
                        },
                      ),
                    ),
                  ],
                ),
              ), 
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: Text('Ver todos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),  
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
  Widget _buildFriends(int index) {
    return Center(
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Theme.of(context).backgroundColor,
            elevation: 3.0,
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child:Container(
              height: 125.0,
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 90.0,
                    child: Image.network(
                      ('https://img.ibxk.com.br/2015/08/27/27151441599410.jpg?w=1040'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text('Nome') 
                ],
              ), 
            ), 
          ),
        ],
      ),
    );
  }
  Widget _buildMoreEvents(int index) {return 
    Center(child:
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Theme.of(context).backgroundColor,
            elevation: 3.0,
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: Container(
              height: 130.0,
              margin: EdgeInsets.all(0.5),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 95.0,
                    width: 160.0,
                    child: Image.network(
                      (_card),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text(_title)
                ],
              ),
            ),
          ),
        ],
      ),  
    );
  }
}