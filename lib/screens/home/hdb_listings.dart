import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'config.dart';
import 'hdb_detail.dart';
import 'package:google_fonts/google_fonts.dart';




class HDBList extends StatefulWidget {
  @override
  HDBListState createState() {
    return new HDBListState();
  }
}

class HDBListState extends State<HDBList> {

  var houses;
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson('https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee');

    setState(() {
      houses = data['result']['records'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: new Icon(
          Icons.arrow_back,
          color: mainColor,
        ),
        title: new Text(
          'HDB Listings',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xff3a506b), fontSize: 22.0, fontWeight: FontWeight.bold)
          ),
        ),
        actions: <Widget>[
          new Icon(
            Icons.menu,
            color: mainColor,
          )
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
}

Future<Map> getJson(String request) async {
  //var apiKey = getApiKey();
  //var url = 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}';
  var response = await http.get(
      Uri.encodeFull(request),
      headers: {
        'Accept':'application/json'
      });
  if(response.statusCode==200){
    return json.decode(response.body);
  }else{
    throw Exception("Failure retrieving data.");
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
        'Featured',
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
                                color: Color(0xff7389ae), fontSize: 16.0)
                        ),
                      ),
                      new Padding(padding: const EdgeInsets.all(2.0)),
                      new Text(
                        houses[i]['flat_type'],
                        maxLines: 3,
                        style: new TextStyle(
                            color: const Color(0xff8785A4), fontFamily: 'Arvo'),
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