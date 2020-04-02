import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/hdb_listings.dart';
import 'package:hdbfinder/screens/home/hdb_settings.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hdbfinder/screens/home/display_mrt.dart';


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
          _createHeader(),
          ListTile(
            leading: Icon(
                Icons.home,
              color: Color(0xff003f91)
            ),
            title: Text('Home',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Color(0xff003f91), fontSize: 16.0)
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mrt())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.save_alt, color: Color(0xff003f91)),
            title: Text('Saved Searches',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Color(0xff003f91), fontSize: 16.0)
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedSearches())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Color(0xff003f91)),
            title: Text('Settings',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Color(0xff003f91), fontSize: 16.0)
              ),

            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Color(0xff003f91)),
            title: Text('Logout',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Color(0xff003f91), fontSize: 16.0)
              ),
            ),
            onTap: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}


Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/images/singapore.jpg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 130.0,
            left: 16.0,
            child: Text("HDBFinder Menu",

                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff0a050a), fontSize: 20.0, fontWeight: FontWeight.w700)
                ),
            )),
      ]));
}


