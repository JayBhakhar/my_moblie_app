import 'package:flutter/material.dart';
import 'package:star_smile/addPhotosContainer.dart';

class Scans extends StatefulWidget {
  @override
  _ScansState createState() => _ScansState();
}

class _ScansState extends State<Scans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scans'),
      ),
      body: Column(
        children: <Widget>[
          AddPhotosContainer(
            colour: Colors.white,
            cardChild: Icon(Icons.add),
            onPress: () {},
          ),
          AddPhotosContainer(
            colour: Colors.white,
            cardChild: Icon(Icons.add),
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
