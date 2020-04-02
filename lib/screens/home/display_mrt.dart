import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:hdbfinder/services/database.dart';
import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:hdbfinder/services/prediction/price_predict.dart';
import 'package:hdbfinder/services/prediction/process_predict.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hdbfinder/services/search_request/pollution_retrieve.dart';
import 'package:hdbfinder/models/house.dart';
import 'package:hdbfinder/services/search_request/data_request.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Mrt extends StatefulWidget{
  @override
  _MrtState createState() => _MrtState();

}

class _MrtState extends State<Mrt>{

  var houses;

  void getData() async {
    var data = await getJson('https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee');

    setState(() {
      houses = data['result']['records'];
    });
  }


  @override
  Widget build(BuildContext context){
    getData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff003f91),
        title: Text('Nearest MRT Station'),
      ),
      body: Container(
      width: double.infinity,
        height: double.infinity,
        child: FutureBuilder(
        future: getMRTName(houses[1]["street_name"]),
          initialData: 'Waiting....',
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Center(
              child: Text(
                snapshot.data,
              ),
            );
          },
        ),
      ),
      );
  }

}


Future<String> getMRTName(String address) async{

  var mrt = await House.getNearestMRT(address);
  return mrt[0];
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

