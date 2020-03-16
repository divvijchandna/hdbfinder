import 'package:flutter/material.dart';
import 'package:hdbfinder/screens/home/home.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    passwordVisible = true;
  }

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
                    'Create Account',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe0e0e2)
                    ),
                    textAlign: TextAlign.center,
                  )
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
                        hintText: 'Name',
                        prefixIcon: new Icon(
                            Icons.account_box,
                            color: Color(0xffe0e0e2)
                        ),
                        hintStyle: TextStyle(
                            color: Color(0xffe0e0e2)
                        )
                    ),
                    style: TextStyle(
                      color: Color(0xffe0e0e2),
                    ),
                    controller: nameController,
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
                        hintStyle: TextStyle(
                            color: Color(0xffe0e0e2)
                        )
                    ),
                    style: TextStyle(
                      color: Color(0xffe0e0e2),
                    ),
                    controller: usernameController,
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
                      hintStyle: TextStyle(
                          color: Color(0xffe0e0e2)
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
                    style: TextStyle(
                      color: Color(0xffe0e0e2),
                    ),
                    controller: passwordController,

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
                      hintText: 'Re-Type Password',
                      prefixIcon: new Icon(
                          Icons.lock,
                          color: Color(0xffe0e0e2)
                      ),
                      hintStyle: TextStyle(
                          color: Color(0xffe0e0e2)
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
                    style: TextStyle(
                      color: Color(0xffe0e0e2),
                    ),
                    controller: passwordController,

                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home())
                        );
                      },
                      child: Text(
                        'Create Account',
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
          ),
        )
      ),
    );
  }
}
