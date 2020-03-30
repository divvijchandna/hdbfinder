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

  Color mainColor = const Color(0xff3a506b);

  String search= '';
  RangeValues _priceRange = RangeValues(0, 1300000);
  RangeValues _areaRange = RangeValues(0, 320);
  RangeLabels _priceLabels = RangeLabels('0', '1300000');
  RangeLabels _areaLabels = RangeLabels('0', '320');
  String _typeValue;
  String _modelValue;
  String _townValue;
  String _sortValue;

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: RangeSlider(
                activeColor: Color(0xff3a506b),
                divisions: 26,
                labels: _priceLabels,
                min: 0,
                max: 1300000,
                values: _priceRange,
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;
                    _priceLabels = RangeLabels(values.start.toInt().toString(), values.end.toInt().toString());
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Price Range (SGD)',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff3a506b), fontSize: 22.0, fontWeight: FontWeight.bold)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: RangeSlider(
                activeColor: Color(0xff3a506b),
                divisions: 16,
                labels: _areaLabels,
                min: 0,
                max: 320,
                values: _areaRange,
                onChanged: (RangeValues values) {
                  setState(() {
                    _areaRange = values;
                    _areaLabels = RangeLabels(values.start.toInt().toString(), values.end.toInt().toString());
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Area Range (Square Metres)',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff3a506b), fontSize: 22.0, fontWeight: FontWeight.bold)
                ),
              ),
            ),
            Container(
              width: 400.0,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text('Apartment Type',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff3a506b), fontSize: 22.0, fontWeight: FontWeight.bold
                      )
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text(
                      "Apartment Type",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "1 ROOM",
                    child: Text(
                      "1 Room",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "2 ROOM",
                    child: Text(
                      "2 Room",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "3 ROOM",
                    child: Text(
                      "3 Room",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "4 ROOM",
                    child: Text(
                      "4 Room",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "5 ROOM",
                    child: Text(
                      "5 Room",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "EXECUTIVE",
                    child: Text(
                      "Executive",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MULTI-GENERATION",
                    child: Text(
                      "Multi Generation",
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _typeValue = value;
                  });
                },
                value: _typeValue,
                elevation: 16,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff7389ae), fontSize: 22.0
                    )
                ),
                underline: Container(
                  height: 2,
                  color: Color(0xff3a506b),
                ),
              ),
            ),
            Container(
              width: 400.0,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text('Apartment Model',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff3a506b), fontSize: 22.0, fontWeight: FontWeight.bold
                      )
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text(
                      "Apartment Model",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "IMPROVED",
                    child: Text(
                      "Improved",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "NEW GENERATION",
                    child: Text(
                      "New Generation",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MODEL A",
                    child: Text(
                      "Model A",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "STANDARD",
                    child: Text(
                      "Standard",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "SIMPLIFIED",
                    child: Text(
                      "5 Room",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MODEL A-MAISONETTE",
                    child: Text(
                      "Model A Maisonette",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "APARTMENT",
                    child: Text(
                      "Apartment",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MAISONETTE",
                    child: Text(
                      "Maisonette",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "TERRACE",
                    child: Text(
                      "Terrace",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "2-ROOM",
                    child: Text(
                      "2 Room",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "IMPROVED-MAISONETTE",
                    child: Text(
                      "Improved Maisonette",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MULTI GENERATION",
                    child: Text(
                      "Multi Generation",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "PREMIUM APARTMENT",
                    child: Text(
                      "Premium Apartment",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "ADJOINED FLAT",
                    child: Text(
                      "Adjoined Flat",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "PREMIUM MAISONETTE",
                    child: Text(
                      "Premium Maisonette",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MODEL A2",
                    child: Text(
                      "Model A2",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "DBSS",
                    child: Text(
                      "DBSS",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "TYPE S1",
                    child: Text(
                      "Type S1",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "TYPE S2",
                    child: Text(
                      "Type S2",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "PREMIUM APARTMENT LOFT",
                    child: Text(
                      "Premium Apartment Loft",
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _modelValue = value;
                  });
                },
                value: _modelValue,
                elevation: 16,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff7389ae), fontSize: 22.0
                    )
                ),
                underline: Container(
                  height: 2,
                  color: Color(0xff3a506b),
                ),
              ),
            ),

            Container(
              width: 400.0,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text('Town',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff3a506b), fontSize: 22.0, fontWeight: FontWeight.bold
                      )
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text(
                      "Town",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "ANG MO KIO",
                    child: Text(
                      "Ang Mo Kio",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BEDOK",
                    child: Text(
                      "Bedok",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BISHAN",
                    child: Text(
                      "Bishan",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BUKIT BATOK",
                    child: Text(
                      "Bukit Batok",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BUKIT MERAH",
                    child: Text(
                      "Bukit Merah",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BUKIT TIMAH",
                    child: Text(
                      "Bukit Timah",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "CENTRAL AREA",
                    child: Text(
                      "Apartment",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "CHOA CHU KANG",
                    child: Text(
                      "Choa Chu Kang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "CLEMENTI",
                    child: Text(
                      "Clementi",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "GEYLANG",
                    child: Text(
                      "Geylang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "HOUGANG",
                    child: Text(
                      "Hougang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "JURONG EAST",
                    child: Text(
                      "Jurong East",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "JURONG WEST",
                    child: Text(
                      "Jurong West",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "KALLANG/WHAMPOA",
                    child: Text(
                      "Kallang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "MARINE PARADE",
                    child: Text(
                      "Marine Parade",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "QUEENSTOWN",
                    child: Text(
                      "Queenstown",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "SENGKANG",
                    child: Text(
                      "Sengkang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "SERANGOON",
                    child: Text(
                      "Serangoon",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "TAMPINES",
                    child: Text(
                      "Tampines",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "TOA PAYOH",
                    child: Text(
                      "Toa Payoh",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "WOODLANDS",
                    child: Text(
                      "Woodlands",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "YISHUN",
                    child: Text(
                      "Yishun",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "LIM CHU KANG",
                    child: Text(
                      "Lim Chu Kang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "SEMBAWANG",
                    child: Text(
                      "Sembawang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "BUKIT PANJANG",
                    child: Text(
                      "Bukit Panjang",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "PASIR RIS",
                    child: Text(
                      "Pair Ris",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "PUNGGOL",
                    child: Text(
                      "Punggol",
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _townValue = value;
                  });
                },
                value: _townValue,
                elevation: 16,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff7389ae), fontSize: 22.0
                    )
                ),
                underline: Container(
                  height: 2,
                  color: Color(0xff3a506b),
                ),
              ),
            ),
            Container(
              width: 400.0,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text('Sort By',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff3a506b), fontSize: 22.0, fontWeight: FontWeight.bold
                      )
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text(
                      "Sort By",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "resale_price",
                    child: Text(
                      "Resale Price",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "floor_area_sqm",
                    child: Text(
                      "Floor Area",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "flat_type",
                    child: Text(
                      "Flat Type",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "flat_model",
                    child: Text(
                      "Flat Model",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "town",
                    child: Text(
                      "Town",
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _sortValue = value;
                  });
                },
                value: _sortValue,
                elevation: 16,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff7389ae), fontSize: 22.0
                    )
                ),
                underline: Container(
                  height: 2,
                  color: Color(0xff3a506b),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(132.5, 20.0, 132.5, 20.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPage(
                              priceMin: _priceRange.start.toInt(),
                              priceMax: _priceRange.end.toInt(),
                              areaMin: _areaRange.start.toInt(),
                              areaMax: _areaRange.end.toInt(),
                              typeValue: _typeValue,
                              modelValue: _modelValue,
                              townValue: _townValue,
                              sortValue: _sortValue,
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
          ],
        ),
      ),
    );
  }
}
