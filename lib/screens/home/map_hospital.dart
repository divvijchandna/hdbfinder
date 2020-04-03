import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

//void main() => runApp(MyApp());

/*class MyMap extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HDB Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationScreen(),
    );
  }
}*/

class LocationScreen extends StatefulWidget
{

  final Key _mapKey = UniqueKey();
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(title: Text('HDBFinder: Nearby Schools',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xffffffff), fontSize: 22.0, fontWeight: FontWeight.bold)
          ),
        ),
          backgroundColor: Color(0xff003f91),
          centerTitle: true,
        ),
        body: TheMap(key:widget._mapKey)
    );
  }
}

class TheMap extends StatefulWidget
{

  ///key is required, otherwise map crashes on hot reload
  TheMap({ @required Key key})
      :
        super(key:key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TheMap>
{
  GoogleMapController _mapController ;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }


  LatLng latlng = LatLng(
    -33.8670522,
    151.1957362,
  );
  Iterable markers = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    try {
      final response =
      await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='+'1.340680, 103.687047' +'&radius=1500&type=hospital&key=AIzaSyBoTJ8MwgJlQ07zjEw3SSyUrPh0Tcveu6E');

      final int statusCode = response.statusCode;

      if (statusCode == 201 || statusCode == 200) {
        Map responseBody = json.decode(response.body);
        List results = responseBody["results"];

        Iterable _markers = Iterable.generate(10, (index) {
          Map result = results[index];
          Map location = result["geometry"]["location"];
          LatLng latLngMarker = LatLng(location["lat"], location["lng"]);
          String hospital_name = result["name"];
          String hospital_vicinity = result["vicinity"];


          return Marker(markerId: MarkerId("marker$index"),position: latLngMarker,
            infoWindow: InfoWindow(title: hospital_name, snippet: hospital_vicinity),
          );
        });

        setState(() {
          markers = _markers;

        });
      } else {
        throw Exception('Error');
      }
    } catch(e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //also this avoids it crashing/breaking when the keyboard is up
      resizeToAvoidBottomInset: false,
      body: GoogleMap(
        markers: Set.from(
          markers,
        ),
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(1.354395, 103.831468),
          zoom: 11.0,
        ),
      ),

    );
  }

}