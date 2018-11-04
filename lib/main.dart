import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spreadapp/config/loginPage.dart';
import 'package:spreadapp/config/theme.dart' as Theme;
import './config/firebasePost.dart';
import './config/firebaseSaves.dart';
import './config/search.dart';
import 'dart:async';
import 'dart:math';
//
void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);runApp(HomePage());    
}
class HomePage extends StatefulWidget {
  @override 
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollViewController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoggedIn = false;
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
  bool darkThemeEnabled = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkThemeEnabled ? Theme.SpreadLight: Theme.SpreadDark,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
    Widget HomePage() {
    return DefaultTabController(
      length: 3,
      child:Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                //decoration: BoxDecoration(
                 //color: Theme.of(context).primaryColor.withOpacity(0.5)
               // ),
              ),
              ListTile(
                title: Text('Entrar com Facebook'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Null>(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                  );
                }
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                },
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
            return <Widget> [
              SliverAppBar(
                //textTheme: Theme.of(context).primaryTextTheme,
                expandedHeight: 100.0,
                elevation: 5.0,
                //backgroundColor:Theme.of(context).primaryColor,
                pinned: true,
                floating: true,
                forceElevated: boxIsScrolled,
                //title: null,
                actions: <Widget>[
                  Switch(
                    value: darkThemeEnabled,
                    onChanged: (changed) {
                     setState(() {
                       darkThemeEnabled = changed;
                     });
                   },
                  ),
                  IconButton(
                    icon: Icon(Icons.tune), //color: Theme.of(context).iconTheme.color),
                    onPressed: () {},
                    tooltip: 'Filtrar',
                  ),
                  IconButton(
                    icon: Icon(Icons.search),// color: Theme.of(context).iconTheme.color),
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    tooltip: 'Buscar',
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),// color: Theme.of(context).iconTheme.color),
                    onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                      tooltip: 'Configurações',
                  ),
                ],
                bottom: TabBar(
                  indicatorWeight: 2.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(fontSize: 13.0,
                  fontFamily: 'MontSerrat'),
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.grey[600],
                  labelColor: Colors.blue,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(text: "PROMOTERS"),
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
            SavesList(),
            ],
          ),
        ),
      ),
    );
  }
}