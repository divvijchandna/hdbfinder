import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/shared/drawer.dart';
import 'package:google_fonts/google_fonts.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff17509b),
        centerTitle: true,
        title: Text('Settings',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xffe5f4e3), fontSize: 32.0)
          ),
        ),
      ),
    );
  }
}