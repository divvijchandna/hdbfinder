import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/nav-drawer.dart';
import 'package:hdbfinder/screens/wrapper.dart';

import 'package:hdbfinder/services/search_request/data_request.dart';

void main() async{
  print(1);
  var f=FetchJSON();
  await f.fetch(pollutionIndex);
  print(f.jsonbody['items'][0]['readings']['o3_sub_index'][f.jsonbody['region_metadata'][0]['name']]);
  print(2);

}


//=> runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: Wrapper(),
//    );
//  }
//}

