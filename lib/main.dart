import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/nav-drawer.dart';
import 'package:hdbfinder/screens/wrapper.dart';
import 'package:hdbfinder/models/hdb_listings.dart';
import 'package:hdbfinder/services/search_request/listing_retrieve.dart';
import 'package:hdbfinder/services/search_request/data_request.dart';

void main() async{
  print(1);
  var f=SearchListings();
  f.setFilters(1, 0, 1, 0, 0);
  f.setSortBy('resale_price');
  f.setPriceRange(200000, 210000);
  f.setTown("jurong east");

  await f.getListingsByFilter();

  print(f.listing.jsonBody);

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

