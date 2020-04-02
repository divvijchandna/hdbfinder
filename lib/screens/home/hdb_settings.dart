import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/saved_searches.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/services/auth.dart';
import 'package:hdbfinder/services/database.dart';
import 'package:hdbfinder/shared/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hdbfinder/shared/loading.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String uid;
  String name;
  String email;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Color(0xffe0e0e2),
      appBar: AppBar(
        backgroundColor: Color(0xff17509b),
        centerTitle: true,
        title: Text('Settings',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xffe0e0e2), fontSize: 32.0)
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Display Name'),
            subtitle: Text(name),
            trailing: Icon(Icons.edit),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Update Display Name"),
                    content: new Form(
                      child: TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'New Display Name',
                        ),
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                    ),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text("Accept"),
                        onPressed: () async {
                          DatabaseService(uid: uid).updateDisplayName(name);
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(email),
            trailing: Icon(Icons.edit),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Update Email"),
                    content: new Form(
                        child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: 'New Email',
                          ),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                    ),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text("Accept"),
                        onPressed: () async {
                          DatabaseService(uid: uid).updateEmail(email);
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text('Reset Password'),
            subtitle: Text('Tap to reset password'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Reset Password"),
                    content: new Text("An email will be sent to $email with a link to change your password"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text("Accept"),
                        onPressed: () async {
                          dynamic result = await AuthService().resetPassword(email);
                          Navigator.of(context).pop();
                          if(result != null) {
                            Flushbar(
                              title: 'Password Reset Link',
                              message: 'Email Sent Successfully',
                              icon: Icon(
                                Icons.email,
                                size: 28,
                                color: Colors.red,
                              ),
                              leftBarIndicatorColor: Colors.red,
                              duration: Duration(seconds: 3),
                            )..show(context);
                          }
                        },
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  void getUserDetails() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      loading = true;
    });
    String n = await DatabaseService(uid: user.uid.toString()).getDisplayName();
    String e = await DatabaseService(uid: user.uid.toString()).getEmail();
    setState(() {
      loading = false;
      uid = user.uid.toString();
      name = n;
      email = e;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }
}