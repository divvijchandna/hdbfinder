import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//void main() => runApp(MyApp());

class MyMap extends StatelessWidget {
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
}

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
        appBar: AppBar(title: const Text('HDB Map')),
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
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //also this avoids it crashing/breaking when the keyboard is up
        resizeToAvoidBottomInset: false,
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(1.354395, 103.831468),
            zoom: 11.0,
          ),
        )
    );
  }
}