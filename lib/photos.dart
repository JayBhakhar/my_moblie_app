import 'package:flutter/material.dart';
import 'package:star_smile/addPhotosContainer.dart';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photos',
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                    text: '1. анфас',
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                    text: '2',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                    text: '3',
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                    text: '4',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                    text: '5',
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                    text: '6',
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                    text: 'add',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
