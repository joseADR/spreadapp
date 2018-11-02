import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/camera_position.dart';
const api_key ="AIzaSyBP66a3yw183ZnCraIH8Zzv9XC9R1VjO28";
class CardPage extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}
class _CardState extends State<CardPage> {
  //Maps
  MapView mapView = MapView();
  var staticMapProvider = StaticMapProvider(api_key);
  CameraPosition cameraPosition;
  Uri staticMapUri;
  showMap(){
    mapView.show(
      MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: CameraPosition(Location(-22.507820, -43.175104), 15.0),
        showUserLocation: true
      ),
    );
  }
  @override
  void initState(){
    super.initState();
      cameraPosition = CameraPosition(Location(-22.507820, -43.175104), 15.0);
      staticMapUri = staticMapProvider.getStaticUri(
        Location(-22.507820, -43.175104), 15,
        height: 400, width: 900, mapType: StaticMapViewType.roadmap);  
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
                expandedHeight: 220.0,
                elevation: 1.0,
                pinned: true,
                floating: false,
                forceElevated: innerboxIsScrolled,
                title: null,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Image.network('http://soupetropolis.com/wp-content/uploads/2018/06/bauernfest-foto-divulga%C3%A7%C3%A3o.jpg',
                  fit: BoxFit.cover,
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
                    Text('bauernfest'.toUpperCase(),
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
                height: 15.0,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    IconButton(
                      color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                      icon:Icon(Icons.thumb_up),
                      onPressed: null,
                    ),
                    IconButton(
                      color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                      icon:Icon(Icons.check_circle_outline),
                      onPressed: null,
                    ),
                    IconButton(
                      color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                      icon:Icon(Icons.favorite_border),
                      onPressed: null,
                    ),
                    IconButton(
                      color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                      icon:Icon(Icons.share),
                      onPressed: null,
                    ),
                  ]
                ),
              ),
              Divider(color: IconTheme.of(context).color,),
              Container(
              margin: EdgeInsets.symmetric(horizontal:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical:10.0),
                          child: 
                          Text(
                            'Descrição',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MontSerrat',
                            ),
                          ),
                        ),
                        Container(
                          child: Text('10/jun'.toUpperCase(),
                            style: TextStyle(
                              color: Color(0xffec0000),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MontSerrat',
                              fontSize: 16.0,
                            ),
                          ),
                        ), 
                      ],
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.symmetric(horizontal:10.0),
                    child: Text(
                      'A única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério. É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.',
                      style: TextStyle(
                        fontFamily: 'MontSerrat',
                      ),
                    ),
                  ),
                  Divider(
                    height: 20.0,
                    color: IconTheme.of(context).color,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children:<Widget>[       
                              Container(
                                padding: EdgeInsets.only(right:10.0),
                                child:
                                  Icon(Icons.location_on),
                                  ),
                              Container(
                                child:Text('um local qualquer',
                                  style:TextStyle(
                                  fontFamily: 'MontSerrat',
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Row(
                            children:<Widget>[
                              Container(
                                padding: EdgeInsets.only(right:10.0),
                                child:Icon(Icons.timer),
                              ),
                              Container(
                                child:Text('Início 13:50 Término 18:30',
                                style: TextStyle(
                                  fontFamily: 'MontSerrat',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 20.0,
                    color: IconTheme.of(context).color,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Column(
                      children:<Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget>[
                              Text(
                                'Como Chegar',
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width:15.0),
                              Icon(Icons.arrow_drop_down_circle
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          child:Image.network(staticMapUri.toString()),
                          onTap: showMap,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],    
        ),
      ),
    );  
  }
}