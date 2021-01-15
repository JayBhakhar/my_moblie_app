import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_smile/addPhotosContainer.dart';
import 'package:star_smile/main.dart';
import 'package:star_smile/patient_details.dart';
import 'package:star_smile/photos.dart';
import 'package:star_smile/plan_of_treatment.dart';
import 'package:star_smile/x-ray_and_CT.dart';

class Scans extends StatefulWidget {
  static String id = 'scans';
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
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Myapp();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                // leading: Icon(Icons.message),//TODO:add a status icon
                title: Text('Patient Detail'),
                onTap: () {
                  Navigator.pushNamed(context, PatientDetails.id);
                },
              ),
              ListTile(
                // leading: Icon(Icons.account_circle),
                title: Text('Plan of Treatment'),
                onTap: () {
                  Navigator.pushNamed(context, PlanOfTreatment.id);
                },
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: Text('Photos'),
                onTap: () {
                  Navigator.pushNamed(context, Photos.id);
                },
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: Text('X-Ray And CT-scan'),
                onTap: () {
                  Navigator.pushNamed(context, XrayAndCt.id);
                },
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: Text('Scans'),
                onTap: () {
                  Navigator.pushNamed(context, Scans.id);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, XrayAndCt.id);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Icon(
                Icons.arrow_forward,
              ),
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
            child: ListView(
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
                            flex: 1,
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
                                  flex: 1,
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
