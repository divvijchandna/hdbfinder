import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/screens/home/home.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff3a506b),
        centerTitle: true,
        title: Text('Settings'),
      ),
    );
  }
}
