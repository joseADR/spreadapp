import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './config/firebasePost.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MaterialApp(
    theme: ThemeData(
      splashColor: Colors.blue,
      brightness:Brightness.dark,
      primaryColorDark: Colors.black12,
      iconTheme: IconThemeData(
        color: Colors.white,
      )
    ),
    title: "Spread",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}


class MyApp extends StatefulWidget {
  @override 
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

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
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
            return <Widget> [
              SliverAppBar(
                expandedHeight: 110.0,
                elevation: 5.0,
                backgroundColor: Colors.black.withOpacity(0.6),
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
                    onPressed: null,
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
            Text("test2"),
            PostList(),
            Text("test3"),
          ],
        ),
        ),
      ),
    );
  }
}