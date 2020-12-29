import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:star_smile/addPhotosContainer.dart';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                    onPress: getImage, //todo:add photo from gallaery
                    cardChild:
                        _image == null ? Icons.add_a_photo : Image.file(_image),
                    colour: Colors.white,
                  ),
                  //todo: need to add text here but it mess up to layout of add photo
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add_a_photo,
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
                      Icons.add_a_photo,
                    ),
                    colour: Colors.white,
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add_a_photo,
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
                      Icons.add_a_photo,
                    ),
                    colour: Colors.white,
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add_a_photo,
                    ),
                    colour: Colors.white,
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: () {}, //todo:add photo from gallaery
                    cardChild: Icon(
                      Icons.add_a_photo,
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
