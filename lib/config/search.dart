import 'package:flutter/material.dart';

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