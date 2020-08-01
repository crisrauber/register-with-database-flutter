import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

Widget build(BuildContext context) {
                     
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        backgroundColor: Color(0xFF151026),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}