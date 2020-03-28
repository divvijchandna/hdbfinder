import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/search_bar_home.dart';
import 'package:hdbfinder/screens/home/search_page.dart';
import 'package:hdbfinder/services/auth.dart';
import 'package:hdbfinder/shared/drawer.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AuthService _auth = AuthService();
  SearchBar searchBar;
  final _formKey = GlobalKey<FormState>();
  String search= '';

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
              alignment: Alignment.topCenter,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Color(0xff3a506b), width: 2.0)
                          ),
                          focusedBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Color(0xff3a506b), width: 2.0)
                          ),
                          hintText: 'Search',
                          prefixIcon: new Icon(
                              Icons.search,
                              color: Color(0xff3a506b)
                          ),
                          hintStyle: TextStyle(
                              color: Color(0xff3a506b)
                          )
                      ),
                      style: TextStyle(
                        color: Color(0xffe0e0e2),
                      ),
                      onChanged: (val) {
                        setState(() => search = val);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(135.0, 10.0, 135.0, 0.0),
                child: Container(
                  width: 30.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPage(
                              search: search,
                            )),
                      );
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe0e0e2),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    color: Color(0xff3a506b),
                  ),
                )
            ),
          ],
        )
    );


  }
}

