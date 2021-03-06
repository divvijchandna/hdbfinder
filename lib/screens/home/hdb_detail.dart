import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:hdbfinder/screens/home/map_view.dart';
import 'package:hdbfinder/screens/home/map_hospital.dart';
import 'package:hdbfinder/services/database.dart';
import 'package:hdbfinder/services/search_request/data_request.dart';
import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:hdbfinder/services/prediction/price_predict.dart';
import 'package:hdbfinder/services/prediction/process_predict.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hdbfinder/services/search_request/pollution_retrieve.dart';



class HDBDetail extends StatefulWidget {
  final houses;
  final i;
  final PollutionIndex p=PollutionIndex();
  var region;
  final List <double> resales = new List(12);

  HDBDetail(this.houses, this.i){
    var count=0;
    for (int i = 2021; i < 2031; i++) {
      var input = processInput(
          6,
          i,
          houses['town'],
          houses['flat_type'],
          houses['storey_range'],
          houses['floor_area_sqm'],
          houses['flat_model']
      );
      int predict = score(input);
      resales[count] = processOutput(predict, i);
      count++;
    }
    p.fetch();
    if(houses['town'] == 'BUKIT BATOK'|| houses['town']== 'CHOA CHU KANG'|| houses['town'] =='CLEMENTI'|| houses['town'] =='JURONG EAST'|| houses['town'] =='JURONG WEST'|| houses['town'] =='LIM CHU KANG'|| houses['town'] =='BUKIT PANJANG')
      region=0;
    else if(houses['town'] == 'BEDOK'|| houses['town']== 'HOUGANG'|| houses['town'] =='KALLANG/WHAMPOA'|| houses['town'] =='SERANGOON'|| houses['town'] =='MARINE PARADE'|| houses['town'] =='TAMPINES'|| houses['town'] =='GEYLANG'|| houses['town'] =='PASIR RIS'|| houses['town'] =='PUNGGOL')
      region=2;
    else if(houses['town'] == 'ANG MO KIO'|| houses['town']== 'BISHAN'|| houses['town'] =='CENTRAL AREA'|| houses['town'] =='TOA PAYOH')
      region=3;
    else if(houses['town'] == 'BUKIT MERAH'|| houses['town']== 'BUKIT TIMAH'|| houses['town'] =='QUEENSTOWN')
      region=4;
    else if(houses['town'] == 'SENGKANG'|| houses['town']== 'WOODLANDS'|| houses['town'] =='YISHUN'|| houses['town'] =='SEMBAWANG')
      region=5;

  }


  @override
  _HDBDetailState createState() => _HDBDetailState();
}

class _HDBDetailState extends State<HDBDetail> {

  var icon = Icon(Icons.bookmark_border, color: Colors.white);
  bool saved = false;
  var image_url = ['https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/da97d034-a526-4cee-b401-8627f40a2aab/thumbs/SSR_4169.JPG?1535097721',
    'https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/29d3f480-cb12-41f7-94c6-7a859c68114a/thumbs/L_DSC2611.jpg?1535099398',
    'https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/107118d2-aa80-4f27-a66e-1cf3d965d84e/thumbs/IMG_8959.jpg?1535122973',
    'https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/d8e2ae83-1b3c-4903-8e6a-2d755e6c5f31/thumbs/208_Petir_Rd_Pic5.jpg?1535124231',
    'https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/67a9c73e-df03-490c-be4e-78d19eddf30e/thumbs/0932_10pm_1.jpg?1535125885',
    'https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/8877be15-7226-4d67-8f32-3118720d0f01/thumbs/DSC_0111_%28Medium%29.jpg?1535159785',
    'https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/6135d8bf-d5a6-4cb3-bd22-33ed4a8f2784/thumbs/IMG_0315.jpg?1535162673',
    'https://s3-ap-southeast-1.amazonaws.com/homebyhitcheed-staging/images/09308387-db49-4a40-b46b-599ddf60e380/thumbs/0932_TT_5.jpg?1535163983',
    'https://www.renonation.sg/wp-content/uploads/Absolook-181b-boon-lay-meadow-5.jpg',
    'https://www.renonation.sg/wp-content/uploads/corazon-visioncrest-01.jpg'];


  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    setFlag();
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: [
        new Image.network(
          image_url[widget.i % 10],
          fit: BoxFit.cover,
        ),
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 400.0,
                    height: 400.0,
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      image: new DecorationImage(
                          image: new NetworkImage(
                              image_url[widget.i % 10]),
                          fit: BoxFit.cover),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: new Offset(0.0, 10.0))
                      ]),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                              widget.houses["block"] + ', ' + widget
                                  .houses["street_name"],
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 30))
                          )),

                      new Text(
                        '\$' + '${widget.houses["resale_price"]}',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),

                      )
                    ],
                  ),
                ),
                new Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[



                    new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: icon,
                            onPressed: () async {
                              if (saved == false) {
                                setState(() {
                                  icon =
                                      Icon(Icons.bookmark, color: Colors.white);
                                });
                                var uid = await getUid();
                                DatabaseService(uid: uid).updateSavedListings(
                                    widget.houses);
                              }
                            },
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)),
                        )

                    ),


                  ],
                ),

                new Row(
                    children: <Widget>[
                      new Icon(Icons.explore, color: Colors.white, size: 20),
                      new Text(
                          '\n' + '   Neighbourhood: ' + widget.houses["town"] +
                              '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(Icons.explore, color: Colors.white, size: 20),
                      new Text(
                          '\n' + '   Region: ' + widget.p.readings[widget.region].name.toUpperCase()+
                              '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(Icons.home, color: Colors.white, size: 20),
                      new Text(
                          '\n' + '   Flat Type: ' + widget.houses["flat_type"] +
                              '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(
                          Icons.star_border, color: Colors.white, size: 20),
                      new Text(
                          '\n' + '   Model: ' + widget.houses["flat_model"] +
                              '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(
                          Icons.crop_square, color: Colors.white, size: 20),
                      new Text('\n' + '   Area (sqm): ' +
                          widget.houses["floor_area_sqm"] + '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(
                          Icons.calendar_today, color: Colors.white, size: 20),
                      new Text(
                          '\n' + '   Date: ' + widget.houses["month"] + '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(
                          Icons.calendar_today, color: Colors.white, size: 20),
                      new Text('\n' + '   Lease Commencement: ' +
                          widget.houses["lease_commence_date"] + '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(
                          Icons.calendar_today, color: Colors.white, size: 20),
                      new Expanded(
                          child: new Text(
                              '\n' + '   Remaining Lease: ' + '\n   ' +
                                  widget.houses["remaining_lease"] + '\n',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 18))
                          ))
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(
                          Icons.location_city, color: Colors.white, size: 20),
                      new Text(
                          '\n' + '   Storey: ' + widget.houses["storey_range"] +
                              '\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[
                      new Icon(
                          Icons.spa, color: Colors.white, size: 20),
                      new Text(
                          '\n' + '\n' + '   Pollution:   ' +
                              'Status: ' + widget.p.status.toUpperCase() +
                              '\n                      ' + '  PM10: ' + widget.p.readings[widget.region].pm10.toString() +
                              '\n                      ' + '  SO2: '+ widget.p.readings[widget.region].so2.toString()

                          ,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 18))
                      )
                    ]),
                new Row(
                    children: <Widget>[

                      new Text(
                        '\n\n',

                      )
                    ]),
                new Row(
                    children: <Widget> [

                      new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            width: 160.0,
                            height: 80.0,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  ButtonTheme(
                                      height: 70,
                                      minWidth: 120,
                                      child:  RaisedButton(

                                        onPressed: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => LocationScreen(
                                                  //search: search,
                                                )),
                                          );
                                        },
                                        child: Text(
                                          'Nearby\nSchools',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffe0e0e2),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        color: Color(0xaa3C3261),
                                      )

                                  )
                                  ,]
                            ),
                          )
                      ),
                      new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            width: 170.0,
                            height: 80.0,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  ButtonTheme(
                                      height: 70,
                                      minWidth: 200,
                                      child:  RaisedButton(

                                        onPressed: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => LocationScreen1(
                                                  //search: search,
                                                )),
                                          );
                                        },
                                        child: Text(
                                          'Nearby Hospitals',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffe0e0e2),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        color: Color(0xaa3C3261),
                                      )

                                  )
                                  ,]
                            ),
                          )
                      ),
                    ]
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Text(
                          '\n\n'+'Resale Price\n',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600))
                      )

                    ]),
                Center(
                    child: Container(
                        color: Colors.white,                        child: SfCartesianChart(
                        plotAreaBackgroundColor: Colors.white,

                        // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<ResaleData, String>(
                              dataSource:

                              [
                                // Bind data source

                                ResaleData('2021', widget.resales[1]),
                                ResaleData('2022', widget.resales[2]),
                                ResaleData('2023', widget.resales[3]),
                                ResaleData('2024', widget.resales[4]),
                                ResaleData('2025', widget.resales[5]),
                                ResaleData('2026', widget.resales[6]),
                                ResaleData('2027', widget.resales[7]),
                                ResaleData('2028', widget.resales[8]),
                                ResaleData('2029', widget.resales[9]),
                                ResaleData('2030', widget.resales[10]),

                              ]

                              ,
                              xValueMapper: (ResaleData resaleData,
                                  _) => resaleData.year,
                              yValueMapper: (ResaleData resaleData,
                                  _) => resaleData.resale,
                              // Render the data label

                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  textStyle:ChartTextStyle(color: Colors.red))
                          )
                        ]
                    )
                    )
                )


              ],
            ),
          ),
        )
      ]),
    );
  }

  Future<String> getUid() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    return uid;
  }

  void setFlag() async {
    String uid = await getUid();
    List idList = await DatabaseService(uid: uid).getListingIds();
    if(idList.contains(widget.houses['_id'])) {
      saved = true;
      setState(() {
        icon = Icon(Icons.bookmark, color: Colors.white);
      });
    }
    else {
      saved = false;
    }
  }
}




class ResaleData
{
  ResaleData(this.year, this.resale);
  final String year;
  final double resale;
}


