import 'package:flutter/material.dart';
import 'package:hdbfinder/shared/drawer.dart';

class SearchPage extends StatefulWidget {
  final String search;

  SearchPage({this.search});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff3a506b),
        centerTitle: true,
        title: Text('Home'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<dynamic>
          )
        ],
      )
    );
  }
}
