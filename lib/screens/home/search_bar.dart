import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/alternate_home.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/screens/home/search_bar.dart';
import 'package:hdbfinder/screens/home/search_bar_home.dart';
import 'package:hdbfinder/screens/nav-drawer.dart';
import 'package:hdbfinder/screens/home/hdb_settings.dart';
import 'package:hdbfinder/screens/home/search_bar_home.dart';
import 'package:hdbfinder/screens/home/search_bar.dart';
import 'package:hdbfinder/screens/home/home.dart';


class SearchBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('HDB Home Page'),
        backgroundColor: Color(0xff3a506b),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), onPressed: (){
                showSearch(context: context, delegate: DataSearch());

              } )
        ]
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'HDBFinder Menu',
                style: TextStyle(color: Color(0xff3a506b), fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Color(0xffb5BAD0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Saved Searches'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SavedSearches())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final cities = [
    "Ang Mo Kio",
    "Bedok",
    "Bishan",
    "Clementi",
    "Geylang",
    "Jurong East",
    "Marine Parade",
    "Punggol",
    "Queenstown"
  ];

  final recentCities = [
    "Bedok",
    "Clementi",
    "Queenstown",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar

    return [
      IconButton(
          icon: Icon(Icons.clear), onPressed: (){
            query = "";
          } )
    ];


  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on left of app bar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        } );

  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),

      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty?recentCities :
    cities.where((p) => p.startsWith(query)).toList();
    
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.location_city),
          title: RichText(text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold),
            children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey))
            ]),
          ),
        ),

      itemCount: suggestionList.length ,
    );



  }

}