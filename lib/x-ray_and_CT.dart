import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_smile/addPhotosContainer.dart';

class XrayAndCt extends StatefulWidget {
  @override
  _XrayAndCtState createState() => _XrayAndCtState();
}

class _XrayAndCtState extends State<XrayAndCt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('X-ray and CT-scan'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: AddPhotosContainer(
              colour: Colors.white,
              cardChild: Icon(Icons.add),
              onPress: () {},
              text: '1',
            ),
          ),
          Expanded(
            flex: 2,
            child: AddPhotosContainer(
              colour: Colors.white,
              cardChild: Icon(Icons.add),
              onPress: () {},
              text: '2',
            ),
          ),
          Expanded(
            flex: 2,
            child: AddPhotosContainer(
              colour: Colors.white,
              cardChild: Icon(Icons.add),
              onPress: () {},
              text: '3',
            ),
          ),
        ],
      ),
    );
  }
}
