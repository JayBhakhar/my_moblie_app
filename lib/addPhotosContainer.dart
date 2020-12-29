import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPhotosContainer extends StatelessWidget {
  AddPhotosContainer(
      {@required this.colour,
      @required this.cardChild,
      @required this.onPress,
      @required this.text});

  final dynamic text;
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: cardChild,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: colour,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
