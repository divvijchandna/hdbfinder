import 'dart:async';
import 'dart:convert';
//import 'package:hdbfinder/screens/home/search_filters.dart';
import 'package:hdbfinder/screens/home/search_page.dart';
import 'package:hdbfinder/shared/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'config.dart';
import 'hdb_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';





class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var houses;
  Color mainColor = const Color(0xff3a506b);

  void getData() async {
    var data = await getJson('https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee');

    setState(() {
      houses = data['result']['records'];
    });
  }

  final _formKey = GlobalKey<FormState>();
  String search= '';

  @override
  Widget build(BuildContext context) {
    getData();

    return new Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff17509b),
        centerTitle: true,
        title: Text('Home',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xffe0e0e2), fontSize: 32.0)
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
                              borderSide: new BorderSide(color: Color(0xff17509b), width: 2.0)
                          ),
                          focusedBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Color(0xff17509b), width: 2.0)
                          ),
                          hintText: 'Search by Keyword',
                          prefixIcon: new Icon(
                              Icons.search,
                              color: Color(0xff17509b)
                          ),
                          hintStyle: TextStyle(
                              color: Color(0xff17509b)
                          )
                      ),
                      style: TextStyle(
                        color: Color(0xff17509b),
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
                                  color: Color(0xffe5f4e3), fontSize: 18.0, fontWeight: FontWeight.normal)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xff17509b),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchFilters()
                            ),
                          );
                        },
                        child: Text(
                          'Search with Filters',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xffe5f4e3), fontSize: 17.0, fontWeight: FontWeight.normal)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xff17509b),
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
                              return new HDBDetail(houses[i], i);
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
                color: Color(0xff6d326d), fontSize: 32.0)
        ),
      ),
    );
  }
}




class HDBCell extends StatelessWidget {

  final houses;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://picsum.photos/300?image=522';
  HDBCell(this.houses, this.i);

  final List<String> imageList = ["https://picsum.photos/300?image=522",
    "https://media.istockphoto.com/photos/public-housing-in-bishan-singapore-picture-id516264474?s=2048x2048",
    "https://cmg.scdn4.secure.raxcdn.com/sites/default/files/imagecache/600x360/news/singapore%20hdb%20homes.jpg",
    "https://www.straitstimes.com/sites/default/files/styles/article_pictrure_780x520_/public/articles/2014/01/16/sjhdb160114e_2x.jpg?itok=ME2bkpvJ&timestamp=1436853264",
    "https://upload.wikimedia.org/wikipedia/commons/5/5f/Housing_and_Development_Board_flats%2C_Bukit_Batok_West_Avenue_5%2C_Singapore_-_20050528.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/8/8d/Edgedale_10%2C_Jan_06.JPG",
    "https://www.asiaone.com/sites/default/files/styles/article_main_image/public/original_images/Oct2014/20141025_bto_tnp.jpg?itok=V0RGzBns",
    "https://i.pinimg.com/564x/15/73/ff/1573ff51612dcb40b50a9a3927caf1c6.jpg",
    "https://www.todayonline.com/sites/default/files/boontiong_pt_1_0.jpg",
    "https://media.homeanddecor.com.sg/public/2017/02/57693-06q8038.jpg"
  ];




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
                          imageList[i% (imageList.length)]), // + houses[i]['poster_path']),
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
                                color: Color(0xff17509b), fontSize: 18.0)
                        ),
                      ),
                      new Padding(padding: const EdgeInsets.all(2.0)),
                      new Row(
                        children: [

                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.home,
                              color: Color(0xff6d326d),
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
                                      color: Color(0xff6d326d), fontSize: 14.0)
                              ),
                            ),
                          ),
                          Spacer(),

                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.attach_money,
                              color: Color(0xff6d326d),
                              size: 18.0,
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.all(0.0),
                              child: new Text(
                                houses[i]['resale_price'],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(0xff6d326d), fontSize: 14.0)

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