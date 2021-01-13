import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBar1 extends StatefulWidget {
  @override
  _TabBar1State createState() => _TabBar1State();
}

class _TabBar1State extends State<TabBar1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              onPressed: null,
              child: Icon(Icons.arrow_back),
            ),
            FlatButton(
              onPressed: null,
              child: Icon(Icons.arrow_forward),
            ),
            FlatButton(
              onPressed: null,
              child: Icon(Icons.close),
            ),
            FlatButton(
              onPressed: null,
              child: Icon(Icons.check),
            ),
          ],
        ),
      ),
      body: BottomAppBar(
        child: Text('das'),
        color: Colors.pink,
      ),
    );
  }
}
