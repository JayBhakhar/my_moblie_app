import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPhotosContainer extends StatelessWidget {
  AddPhotosContainer(
      {@required this.colour,
      @required this.cardChild,
      @required this.onPress,
      @required this.text});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: cardChild,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: colour,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
