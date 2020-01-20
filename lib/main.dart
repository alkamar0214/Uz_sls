import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uz_slslab/borrower.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false, 
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/borrower': (BuildContext context) => new Borrower(),

      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _rememberMe = false;
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String msg = '';


Future<List> login1() async {
    final response = await http.post('http://192.168.1.10/LAB-System/api/login1.php', body: {
      'username': controllerUser.text,
      'password': controllerPass.text,
    });
  

  var datauser = json.decode(response.body);

  if (datauser.length == 0) {
    setState(() {
      msg = 'user incorrect';
    });
  } else {
    // if (datauser[0]['type']=='Admin') {
      Navigator.pushReplacementNamed(context, '/borrower');
    // } else if (datauser[0]['type']=='Assisstant') {
      // Navigator.pushReplacementNamed(context, '/staffPage');
    // }
    // setState(() {
      // email = datauser[0]['email'];
    // });
    
  }
  // return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            // Container(
            //   child: Stack(
            //     children: <Widget>[
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  //   child: Text('Hello',
                  //       style: TextStyle(
                  //           fontSize: 80.0, fontWeight: FontWeight.bold)),
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    
                    ),
                    
                  ),
                 
                    Image.asset('assets/uz-lab-logo.png',width: 380),
                    
            //       )
            //     ],
            //   ),
            // ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: controllerUser,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: controllerPass,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                 SizedBox(height: 40.0),
                    new RaisedButton(
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                       onPressed: (){
                        login1();
                        Navigator.pop(context);
                      },
                    ),
                    
                   
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Center(
                            //   child:
                            //       ImageIcon(AssetImage('assets/facebook.png')),
                            // ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Log in with Gmail',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New User ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
