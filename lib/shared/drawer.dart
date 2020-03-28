import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/hdb_listings.dart';
import 'package:hdbfinder/screens/home/hdb_settings.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/services/auth.dart';

class MenuDrawer extends StatefulWidget {

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
