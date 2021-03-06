import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/services/auth.dart';
import 'package:hdbfinder/shared/loading.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String rePassword = '';
  String name = '';
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;

  @override
  void initState() {
    passwordVisible1 = true;
    passwordVisible2 = true;
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xff003f91),
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
                                color: Color(0xffe5f4e3), fontSize: 45.0, fontWeight: FontWeight.bold),
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xffe5f4e3), fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                    textAlign: TextAlign.center,
                  )
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
                              hintText: 'Name',
                              prefixIcon: new Icon(
                                  Icons.account_box,
                                  color: Color(0xffe0e0e2)
                              ),
                              hintStyle: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xffe5f4e3)),
                              ),
                          ),
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xffe5f4e3)),
                          ),
                          validator: (val) => val.isEmpty ? 'Enter your name' : null,
                          onChanged: (val) {
                            setState(() => name = val);
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
                                    color: Color(0xffe5f4e3)),
                              ),
                          ),
                          style:GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xffe5f4e3)),
                          ),
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
                          obscureText: passwordVisible1,
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
                                  color: Color(0xffe5f4e3)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xffe0e0e2),
                              ),
                              onPressed: () {
                                // Update the state i.e. toggle the state of passwordVisible variable
                                setState(() {
                                  passwordVisible1 = !passwordVisible1;
                                });
                              },
                            ),
                          ),
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xffe5f4e3)),
                          ),
                          validator: (val) => val.length < 6 ? 'Password should be at least 6 characters' : null,
                          onChanged: (val) {
                            setState(() => password = val);
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
                          obscureText: passwordVisible2,
                          decoration: InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Color(0xffe0e0e2))
                            ),
                            focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Color(0xffe0e0e2))
                            ),
                            hintText: 'Re-Type Password',
                            prefixIcon: new Icon(
                                Icons.lock,
                                color: Color(0xffe0e0e2)
                            ),
                            hintStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xffe5f4e3)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xffe0e0e2),
                              ),
                              onPressed: () {
                                // Update the state i.e. toggle the state of passwordVisible variable
                                setState(() {
                                  passwordVisible2 = !passwordVisible2;
                                });
                              },
                            ),
                          ),
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xffe5f4e3)),
                          ),
                          validator: (val) => val != password ? "Passwords don't match" : null,
                          onChanged: (val) {
                            setState(() => rePassword = val);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () async {
                        if(_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth.register(email, password, name);
                          if(result == null) {
                            setState(() => loading = false);
                            Flushbar(
                              title: 'Invalid email',
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
                        'Create Account',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Color(0xff6d326d), fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Color(0xffe0e0e2),
                    ),
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}
