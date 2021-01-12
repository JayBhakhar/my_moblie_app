import 'package:flutter/material.dart';
import 'package:star_smile/addPhotosContainer.dart';

class Scans extends StatefulWidget {
  @override
  _ScansState createState() => _ScansState();
}

enum Check { a, b, c }

class _ScansState extends State<Scans> {
  bool button2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scans'),
      ),
      body: Column(
        children: [
          Expanded(child: Text('sliber button2')), //
          Expanded(child: Text('sliber button1')),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: AddPhotosContainer(
                    text: 'first with out condition',
                    colour: Colors.yellow,
                    onPress: () {},
                    cardChild: button2 ? Icon(Icons.home) : Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ), //
        ],
      ),
    );
  }
}
