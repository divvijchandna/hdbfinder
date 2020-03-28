import 'package:flutter/material.dart';
import 'package:hdbfinder/services/search_request/listing_retrieve.dart';
import 'package:hdbfinder/shared/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  final String search;

  SearchPage({this.search});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff3a506b),
        centerTitle: true,
        title: Text('Search Results',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xffe0e0e2), fontSize: 22.0, fontWeight: FontWeight.bold)
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container()
        ],
      )
    );
  }

  void initState() {
    super.initState();
    setState(() {
      performSearch(widget.search);
    });
  }

}

void performSearch(String search) async {
  var l = SearchListings();
  await l.getListingsByKeyword(search);
  print(l.listing.jsonBody);
}
