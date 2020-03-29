import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/hdb_detail.dart';
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
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xffe0e0e2), fontSize: 18.0, fontWeight: FontWeight.w700)
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
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xffe0e0e2), fontSize: 17.0, fontWeight: FontWeight.w700)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xff3a506b),
                      ),
                    )
                ),
              ],
            ),
            new HDBTitle(mainColor),
            new Expanded(
              child: new ListView.builder(
                  itemCount: houses == null ? 0 : houses.length,
                  itemBuilder: (context, i) {
                    return new FlatButton(
                      child: new HDBCell(houses, i),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) {
                              return new HDBDetail(houses[i]);
                            }));
                      },
                      color: Colors.white,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    setState(() {
      performSearch(widget.search);
    });
  }
}

class HDBTitle extends StatelessWidget {
  final Color mainColor;

  HDBTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Listings',
        style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Color(0xff7389ae), fontSize: 32.0)
        ),
      ),
    );
  }
}

class HDBCell extends StatelessWidget {

  final houses;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://www.straitstimes.com/sites/default/files/styles/article_pictrure_780x520_/public/articles/2014/01/16/sjhdb160114e_2x.jpg?itok=ME2bkpvJ&timestamp=1436853264';
  HDBCell(this.houses, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
//                                child: new Image.network(image_url+movies[i]['poster_path'],width: 100.0,height: 100.0),
                child: new Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          image_url), // + houses[i]['poster_path']),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            new Expanded(
                child: new Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: new Column(
                    children: [
                      new Text(
                        houses[i]['town'] + " Block " + houses[i]['block'],
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xff3A506B), fontSize: 16.0)
                        ),
                      ),
                      new Padding(padding: const EdgeInsets.all(2.0)),
                      new Row(
                        children: [

                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.home,
                              color: Color(0xff7389ae),
                              size: 18.0,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: new Text(
                              houses[i]['flat_type'],
                              maxLines: 3,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Color(0xff7389ae), fontSize: 14.0)
                              ),
                            ),
                          ),
                          Spacer(),

                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.attach_money,
                              color: Color(0xff7389ae),
                              size: 18.0,
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.all(0.0),
                              child: new Text(
                                houses[i]['resale_price'],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(0xff7389ae), fontSize: 14.0)

                                ),

                              )
                          )
                        ],
                      )

                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}