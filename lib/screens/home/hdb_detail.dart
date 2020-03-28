import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HDBDetail extends StatelessWidget {
  final houses;
  var image_url = 'https://picsum.photos/250?image=9';
  HDBDetail(this.houses);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: [
        new Image.network(
          image_url,
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
                              image_url),
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
                            houses["block"]+', '+houses["street_name"],
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: 'Arvo'),
                          )),
                      new Text(
                        '${houses["resale_price"]}',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                new Text(
                    'Neighbourhood: '+ houses["town"] + '\n' +
                        //'Neighbourhood Rank: ' + houses["rank town"] +'\n'+  NOT ACCESSIBLE
                        'Flat Type: ' + houses["flat_type"] +'\n' +
                        'Model: ' + houses["flat_model"] +'\n' +
                        'Area: ' + houses["floor_area_sqm"] +'\n' +
                        'Month: ' + houses["month"] +'\n' +
                        'Lease Commencement: ' + houses["lease_commence_date"] +'\n' +
                        'Remaining Lease: ' + houses["remaining_lease"] +'\n' +
                        'Storey: ' + houses["storey_range"] +'\n'
                    ,style: new TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Container(
                          width: 150.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: new Text(
                            'Rate Unit',
                            style: new TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arvo',
                                fontSize: 20.0),
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)),
                        )),
                    new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: new Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: const Color(0xaa3C3261)),
                      ),
                    ),
                    new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: new Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)),
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
