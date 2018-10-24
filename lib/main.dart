import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './config/firebasePost.dart';
import 'dart:async';
import 'dart:math';
//
void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(MaterialApp(
    theme: ThemeData(

      splashColor: Colors.blue,
      brightness: Brightness.dark,
      primaryTextTheme: TextTheme(title: TextStyle(color:Colors.white,fontFamily: 'MontSerrat')),
      iconTheme: IconThemeData(
        color: Colors.white,
      )
    ),
    title: "Spread",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}
//barra de pesquisa
class DataSearch extends SearchDelegate<String>{
  final recentsEvents =["lista"];
  final events = ['lista2'];
  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear), onPressed: null,)
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return 
      IconButton( 
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, 
          progress: transitionAnimation),
        onPressed: (){});
  }
  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone search for something
    final suggestionList = query.isEmpty?recentsEvents:events;
    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        leading: Icon(Icons.near_me),
        title: RichText(text: TextSpan( 
          text:suggestionList[index].substring(0, query.length),
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
          ),
        )
      ),
    );
  }
}
class MyApp extends StatefulWidget {
  @override 
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollViewController;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Random random;
  List<String> list;
  @override
  void initState() {
    super.initState();
    random = Random();
    refreshList();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
  }
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      list = List.generate(random.nextInt(10), (i) => "Item $i");
    });
    return null;
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
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
            return <Widget> [
              SliverAppBar(
                textTheme: Theme.of(context).primaryTextTheme,
                expandedHeight: 110.0,
                elevation: 3.0,
                backgroundColor:Theme.of(context).primaryColorDark.withOpacity(0.6),
                pinned: true,
                floating: true,
                forceElevated: boxIsScrolled,
                title: null,
                actions: <Widget>[             
                  IconButton(
                    icon: Icon(Icons.tune, color: Theme.of(context).iconTheme.color),
                    onPressed: null,
                    tooltip: 'Filtrar',
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    tooltip: 'Buscar',
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle, color: Theme.of(context).iconTheme.color),
                    onPressed: null,
                    tooltip: 'Configurações',
                  ),
                ],
                bottom: TabBar(
                  indicatorWeight: 1.7,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(fontSize: 12.5),
                  indicatorColor: Theme.of(context).splashColor,
                  unselectedLabelColor: Theme.of(context).iconTheme.color,
                  labelColor: Theme.of(context).splashColor,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(text: "SEGUINDO"),
                    Tab(text: "INÍCIO"),
                    Tab(text: "SALVOS"),
                  ],
                ),
              ),
            ];
          },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            FollowList(),
            RefreshIndicator(
            key: refreshKey,
            child:
              PostList(),
            onRefresh: refreshList, 
            ),
            SaveList(),
            ],
          ),
        ),
      ),
    );
  }
}