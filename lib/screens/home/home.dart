import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff3a506b),
        centerTitle: true,
        title: Text('Home'),
      ),
    );
  }
}
