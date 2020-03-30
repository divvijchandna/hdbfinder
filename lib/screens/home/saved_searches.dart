import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/screens/home/hdb_settings.dart';
import 'package:hdbfinder/shared/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedSearches extends StatefulWidget {
  @override
  _SavedSearchesState createState() => _SavedSearchesState();
}

class _SavedSearchesState extends State<SavedSearches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff003f91),
        centerTitle: true,
        title: Text('Saved Searches',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xffe5f4e3), fontSize: 22.0, fontWeight: FontWeight.bold)
          ),
        ),
      ),
    );
  }
}
