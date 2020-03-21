import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3a506b),
      child: Center(
        child: SpinKitChasingDots(
          color: Color(0xffe0e0e2),
          size: 50.0,
        ),
      ),
    );
  }
}