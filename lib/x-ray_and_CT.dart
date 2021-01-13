import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_smile/addPhotosContainer.dart';

class XrayAndCt extends StatefulWidget {
  @override
  _XrayAndCtState createState() => _XrayAndCtState();
}

class _XrayAndCtState extends State<XrayAndCt> {
  File _image1;
  File _image2;
  File _image3;

  final picker = ImagePicker();

  Future getImage1() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image1 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage2() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image2 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage3() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image3 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
            child: AddPhotosContainer(
              onPress: getImage1,
              cardChild: _image1 == null
                  ? Icon(Icons.add_a_photo)
                  : Image.file(_image1),
              colour: Colors.white,
              text: '1',
            ),
          ),
          Expanded(
            child: AddPhotosContainer(
              onPress: getImage2,
              cardChild: _image2 == null
                  ? Icon(Icons.add_a_photo)
                  : Image.file(_image2),
              colour: Colors.white,
              text: '2',
            ),
          ),
          Expanded(
            child: AddPhotosContainer(
              onPress: getImage3,
              cardChild: _image3 == null
                  ? Icon(Icons.add_a_photo)
                  : Image.file(_image3),
              colour: Colors.white,
              text: '3',
            ),
          ),
        ],
      ),
    );
  }
}
