import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/hdb_detail.dart';
import 'package:hdbfinder/screens/home/search_page.dart';
import 'package:hdbfinder/services/search_request/listing_retrieve.dart';
import 'package:hdbfinder/shared/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFilters extends StatefulWidget {
  @override
  _SearchFiltersState createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {

  var houses;
  Color mainColor = const Color(0xff3a506b);

  void performSearch(String search) async {
    var l = SearchListings();
    await l.getListingsByKeyword(search);

    setState(() {
      houses = l.listing.jsonBody['result']['records'];
    });
  }

  final _formKey = GlobalKey<FormState>();
  String search= '';

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
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Color(0xff3a506b), width: 2.0)
                          ),
                          focusedBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Color(0xff3a506b), width: 2.0)
                          ),
                          hintText: 'Search',
                          prefixIcon: new Icon(
                              Icons.search,
                              color: Color(0xff3a506b)
                          ),
                          hintStyle: TextStyle(
                              color: Color(0xff3a506b)
                          )
                      ),
                      style: TextStyle(
                        color: Color(0xff3a506b),
                      ),
                      onChanged: (val) {
                        setState(() => search = val);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage(
                                  search: search,
                                )
                            ),
                          );
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffe0e0e2),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xff3a506b),
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                    child: Container(
                      width: 200.0,
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () async {

                        },
                        child: Text(
                          'Search with Filters',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffe0e0e2),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xff3a506b),
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
