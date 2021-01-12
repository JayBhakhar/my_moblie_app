import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_smile/addPhotosContainer.dart';

class Scans extends StatefulWidget {
  @override
  _ScansState createState() => _ScansState();
}

enum Check { a, b, c }

class _ScansState extends State<Scans> {
  File _image1;
  File _image2;
  bool button2 = true;
  bool switchValue1 = false;
  bool switchValue2 = false;

  onSwitchValueChanged1(bool newVal) {
    setState(() {
      switchValue1 = newVal;
    });
  }

  onSwitchValueChanged2(bool newVal) {
    setState(() {
      switchValue2 = newVal;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scans'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('scans'),
              Switch(
                  activeColor: Colors.cyan,
                  value: switchValue1,
                  onChanged: (newVal) {
                    onSwitchValueChanged1(newVal);
                  }),
              Text('оттиск'),
            ],
          ), //
          Row(
            children: [
              Text('files'),
              Switch(
                  activeColor: Colors.cyan,
                  value: switchValue2,
                  onChanged: (newVal) {
                    onSwitchValueChanged2(newVal);
                  }),
              Text('ID'),
            ],
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Builder(builder: (context) {
                  if (switchValue2)
                    return Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                            filled: true,
                            hintText: 'model scanner',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                            filled: true,
                            hintText: 'Scanner ID',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    );
                  else
                    return SizedBox(
                      height: 450,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: AddPhotosContainer(
                                    onPress: getImage1,
                                    cardChild: _image1 == null
                                        ? Icon(Icons
                                            .add_a_photo) //todo: change photo
                                        : Image.file(_image1),
                                    colour: Colors.white,
                                    text: '1. upside part',
                                  ),
                                ),
                                Expanded(
                                  child: AddPhotosContainer(
                                    onPress: getImage2,
                                    cardChild: _image2 == null
                                        ? Icon(Icons.add_a_photo)
                                        : Image.file(_image2),
                                    //todo: add close icon when user already selected a photo
                                    colour: Colors.white,
                                    text: '2. downside part',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15.0),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Comment',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
