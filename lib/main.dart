import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_view/map_view.dart';
import 'package:spreadapp/config/loginPage.dart';
import 'package:spreadapp/config/theme.dart' as Temas;
import 'package:spreadapp/services/auth.service.dart';
import './config/firebasePost.dart';
import './config/firebaseFollows.dart';
import './config/firebaseSaves.dart';
import './config/search.dart';
import 'dart:async';
import 'dart:math';
const api_key ="AIzaSyDQIQ6TK-F0NCvvVvx-eaeqPVUL1K0ClPE";

AuthService appAuth = new AuthService();
void main() async {
  Widget _defaultHome = LoginPage();
  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = HomePage();
  }
  MapView.setApiKey(api_key);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => HomePage(),
      '/login': (BuildContext context) => LoginPage(),
    }
  ));    
}
class HomePage extends StatefulWidget {
  @override 
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollViewController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Random random;
  List<String> list;
    
  void initState() {
    super.initState();
    random = Random();
    refreshList();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
  }
    // new Future.delayed(const Duration(seconds: 2));
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
  bool lightThemeEnabled = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThemeEnabled ? Temas.SpreadLight: Temas.SpreadDark,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
  Widget HomePage() {
    return DefaultTabController(
      length: 3,
      child:Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: TabBar(
          indicatorWeight: 1.5,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: 9.0,
              fontFamily: 'MontSerrat',
              fontWeight: FontWeight.bold
              ),
          indicatorColor: Colors.blue,
          unselectedLabelColor: lightThemeEnabled ? Colors.black.withOpacity(0.7) : Colors.grey,
          labelColor: Colors.blue[400],
          controller: _tabController,
          tabs: <Widget>[
            SizedBox(
              height: 58.0,
              child: Tab(
                icon:Icon(Icons.people, 
                  size: 23.0),
                text: 'PROMOTERS',  
              ),
            ),
            SizedBox(
              height: 58.0,
              child: Tab(
                icon:Icon(Icons.home, 
                  size: 23.0),
                text: 'INÍCIO',
              ),
            ),
            SizedBox(
              height: 58.0,
              child: Tab(
                icon:Icon(Icons.favorite_border, 
                  size: 23.0),
                text: 'SALVOS',  
              ),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0.0,
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 6.0),
              child: Switch(
                value: lightThemeEnabled,
                onChanged: (changed) {
                  setState(() {
                    lightThemeEnabled = changed;
                    }
                  );
                },
              ),
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
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              }
            ),
          ],
        ),
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
                title: Text('Item 2'),
                onTap: () {
                  appAuth.logout().then(
                  (_) => Navigator.of(context).pushReplacementNamed('/login')
                  );
                },
              ),
            ],
          ),
        ),
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
    );
  }
}