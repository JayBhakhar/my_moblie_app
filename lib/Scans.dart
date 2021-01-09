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
        children: [
          Expanded(
            child: AddPhotosContainer(
              colour: Colors.white,
              cardChild: Icon(Icons.add),
              onPress: () {},
              text: '1',
            ),
          ),
          Expanded(
            child: AddPhotosContainer(
              colour: Colors.white,
              cardChild: Icon(Icons.add),
              onPress: () {},
              text: '2',
            ),
          ),
        ],
      ),
    );
  }
}
