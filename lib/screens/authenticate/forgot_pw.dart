import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/home.dart';
import 'package:hdbfinder/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a506b),
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
                          style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffe0e0e2)
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe0e0e2)
                    ),
                    textAlign: TextAlign.center,
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
                              hintStyle: TextStyle(
                                  color: Color(0xffe0e0e2)
                              )
                          ),
                          style: TextStyle(
                            color: Color(0xffe0e0e2),
                          ),
                          validator: (val) => val.isEmpty ? 'Enter your email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () async {
                        if(_formKey.currentState.validate()) {
                          dynamic result = await _auth.resetPassword(email);
                          if(result != null) {
                            Flushbar(
                              title: 'Password Reset',
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
                        }
                      },
                      child: Text(
                        'Send Password Reset Link',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff3a506b),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Color(0xffe0e0e2),
                    ),
                  )
              ),
            ],
          )
        ),
      )
    );
  }
}
