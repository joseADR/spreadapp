import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main(){
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());}

const bckColor = Color.fromRGBO(145, 145, 145, 1.0);
const btnColor = Color.fromRGBO(145, 145, 145, 0.9);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      mainAxisAlignment: MainAxisAlignment.start,
      title: 'Spread',
      theme: ThemeData(
        splashColor: Colors.blue,
        brightness:Brightness.dark ,
        primaryColorDark: Colors.black12,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 3,
       
           child: Scaffold(
      
      body: NestedScrollView(
        
        scrollDirection: Axis.vertical,
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              
              expandedHeight: 115.0,
              backgroundColor: Colors.black.withOpacity(0.7),
              
              elevation: 5.0,
              actions: <Widget>[
                
              
              IconButton(
                
                icon: Icon(Icons.tune,color: Colors.white,),
                onPressed: null,
                tooltip: 'Filtrar',
              ),

               IconButton(
                
                icon: Icon(Icons.search,color: Colors.white,),
                onPressed: null,
                tooltip: 'Buscar',
              ),
              IconButton(
                
                icon: Icon(Icons.account_circle,color: Colors.white,),
                onPressed: null,
                tooltip:'Configurações'
              )
              ],
              
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              
              bottom: TabBar(

                indicatorWeight: 1.7,
                indicatorSize: TabBarIndicatorSize.tab,  
                labelStyle: TextStyle(fontSize: 12.5),
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.white70,
                labelColor: Colors.blue,
      
                tabs: [
                  
                  Tab(text: 'SEGUINDO'),
                  Tab(text:'INÍCIO'),
                  Tab(text:'SALVOS'),
                  
                    ],
                controller: _tabController,
                
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            
            Seguindo(),
            Seguindo(),
            Salvos(),
            
          ], 
        ),
      ),
    )       
    );}
  }

class Seguindo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
    );
  }
}
  


class Salvos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
    );
  }
}


