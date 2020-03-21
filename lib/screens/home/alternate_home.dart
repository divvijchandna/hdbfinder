import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/screens/home/search_bar_home.dart';
import 'package:hdbfinder/screens/nav-drawer.dart';
import 'package:hdbfinder/screens/home/hdb_settings.dart';
import 'package:hdbfinder/screens/home/search_bar_home.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        backgroundColor: Color(0xff3a506b),
        centerTitle: true,
        title: Text('Home'),
        actions: [searchBar.getSearchAction(context)]

    );
  }

  _MyHomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: searchBar.build(context)
    );
  }
}