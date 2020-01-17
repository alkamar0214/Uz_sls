import 'package:flutter/material.dart';

class Borrower extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: new AppBar(title: Text('borrower'),),
      body: new Column(
        children: <Widget>[
          new Text('WELCOME STUDENTS')
        ],
      ),
      );
  }
}