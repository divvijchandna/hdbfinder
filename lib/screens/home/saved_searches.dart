import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/hdb_detail.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/screens/home/hdb_settings.dart';
import 'package:hdbfinder/services/database.dart';
import 'package:hdbfinder/shared/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedSearches extends StatefulWidget {
  @override
  _SavedSearchesState createState() => _SavedSearchesState();
}

class _SavedSearchesState extends State<SavedSearches> {

  var houses;
  Color mainColor = const Color(0xff6d326d);

  @override
  Widget build(BuildContext context) {
    setHouses();
    return Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff003f91),
        centerTitle: true,
        title: Text('Saved Listings',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xffe5f4e3), fontSize: 22.0, fontWeight: FontWeight.bold)
          ),
        ),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                              return new HDBDetail(houses[i], i); //pass i later if you want
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
  Future<String> getUid() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    return uid;
  }

  void setHouses() async {
    String uid = await getUid();
    var l = await DatabaseService(uid: uid).getSavedListings();
    setState(() {
      houses = l;
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
        'Saved Listings',
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
                              color: Color(0xff875787),
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
                                      color: Color(0xff875787), fontSize: 14.0)
                              ),
                            ),
                          ),
                          Spacer(),

                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.attach_money,
                              color: Color(0xff875787),
                              size: 18.0,
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.all(0.0),
                              child: new Text(
                                houses[i]['resale_price'],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(0xff875787), fontSize: 14.0)

                                ),

                              )
                          ),
                          new IconButton(
                              icon: Icon(Icons.delete, color: Colors.red,),
                              onPressed: () async {
                                String uid = await getUid();
                                await DatabaseService(uid: uid).deleteSavedListing(houses[i]['_id']);
                              }
                          ),
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

  Future<String> getUid() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    return uid;
  }
}