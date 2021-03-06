import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/authenticate/create_account.dart';
import 'package:hdbfinder/screens/authenticate/forgot_pw.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/services/auth.dart';
import 'package:hdbfinder/shared/loading.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  bool passwordVisible = false;

  @override
  void initState() {
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xff6d326d),
      body: new Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text('HDBFinder',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xffe5f4e3), fontSize: 42.0, fontWeight: FontWeight.bold)
                            ),
                            textAlign: TextAlign.center,)
                        ]
                    )
                ),

                SizedBox(
                  height: 15.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Color(0xffe0e0e2))
                                ),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Color(0xffe0e0e2))
                                ),
                                hintText: 'Email ID',
                                prefixIcon: new Icon(
                                    Icons.email,
                                    color: Color(0xffe0e0e2)
                                ),
                                hintStyle: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(0xffe5f4e3), fontSize: 14.0, fontWeight: FontWeight.bold)
                                ),
                            ),
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xffe5f4e3), fontSize: 14.0, fontWeight: FontWeight.bold)),
                            validator: (val) => val.isEmpty ? 'Enter your email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            maxLines: 1,
                            autofocus: false,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Color(0xffe0e0e2))
                              ),
                              focusedBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Color(0xffe0e0e2))
                              ),
                              hintText: 'Password',
                              prefixIcon: new Icon(
                                  Icons.lock,
                                  color: Color(0xffe0e0e2)
                              ),
                              hintStyle: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Color(0xffe5f4e3), fontSize: 14.0, fontWeight: FontWeight.bold)
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xffe0e0e2),
                                ),
                                onPressed: () {
                                  // Update the state i.e. toggle the state of passwordVisible variable
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xffe5f4e3), fontSize: 14.0, fontWeight: FontWeight.bold)
                            ),
                            validator: (val) => val.length < 6 ? 'Password should be at least 6 characters' : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ),

                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                    child: Container(
                      width: 300.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () async {
                          if(_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth.signIn(email, password);
                            if(result == null) {
                              setState(() => loading = false);
                              Flushbar(
                                title: 'Invalid credentials',
                                message: 'Please try again.',
                                icon: Icon(
                                  Icons.info_outline,
                                  size: 28,
                                  color: Colors.red,
                                ),
                                leftBarIndicatorColor: Colors.red,
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xff003f91), fontSize: 24.0, fontWeight: FontWeight.bold)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xffe0e0e2),
                      ),
                    )
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
                  child: Container(
                      width: 300.0,
                      height: 18.0,
                      child: FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreateAccount())
                          );
                        },
                        child: Text(
                          'CREATE ACCOUNT',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xffe5f4e3), fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
                  child: Container(
                      width: 300.0,
                      height: 18.0,
                      child: FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPassword())
                          );
                        },
                        child: Text(
                          'FORGOT PASSWORD?',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xffe5f4e3), fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
              ],
            )
        )
        ),
    );
  }
}
