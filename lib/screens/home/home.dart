import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/alternate_home.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/screens/home/search_bar.dart';
import 'package:hdbfinder/screens/home/search_bar_home.dart';
import 'package:hdbfinder/screens/nav-drawer.dart';
import 'package:hdbfinder/screens/home/hdb_settings.dart';
import 'package:hdbfinder/services/auth.dart';
import 'package:hdbfinder/screens/home/search_bar_home.dart';
import 'package:hdbfinder/screens/home/search_bar.dart';
import 'package:dio/dio.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AuthService _auth = AuthService();
  SearchBar searchBar;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () async {
//                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff3a506b),
        centerTitle: true,
        title: Text('Home'),

          actions: <Widget>[
            IconButton(
      icon: const Icon(Icons.search),
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchBox())
        );
        }

      ),
    ]
    ),
    );


  }
}

