import 'package:flutter/material.dart';
import 'package:hdbfinder/models/user.dart';
import 'package:hdbfinder/screens/authenticate/authenticate.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
