import 'package:flutter/material.dart';
import 'package:hdbfinder/models/user.dart';
import 'package:hdbfinder/screens/wrapper.dart';
import 'package:hdbfinder/services/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          home: Wrapper(),
      ),
    );
  }
}

//  print(1);
//  var f=SearchListings();
//  f.setFilters(1, 0, 1, 0, 0);
//  f.setSortBy('resale_price');
//  f.setPriceRange(200000, 210000);
//  f.setTown("jurong east");
//
//  await f.getListingsByFilter();
//
//  print(f.listing.jsonBody);
//
//  print(2);


