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
                  ),
                  //todo: need to add text here but it mess up to layout of add photo
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
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
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
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
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add,
                    ),
                    colour: Colors.white,
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
