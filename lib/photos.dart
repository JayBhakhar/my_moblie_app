import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:star_smile/addPhotosContainer.dart';
import 'package:star_smile/main.dart';
import 'package:star_smile/patient_details.dart';
import 'package:star_smile/plan_of_treatment.dart';
import 'package:star_smile/scans.dart';
import 'package:star_smile/x-ray_and_CT.dart';

class Photos extends StatefulWidget {
  static String id = 'photos';
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  File _image1;
  File _image2;
  File _image3;
  File _image4;
  File _image5;
  File _image6;
  File _image7;

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

  Future getImage4() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image4 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage5() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image5 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage6() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image6 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage7() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image7 = File(pickedFile.path);
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
                Navigator.pushReplacementNamed(context, PlanOfTreatment.id);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, XrayAndCt.id);
              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.black,
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
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AddPhotosContainer(
                    onPress: getImage1,
                    cardChild: _image1 == null
                        ? Image.asset('images/myphoto.jpg') //todo: change photo
                        : Image.file(_image1),
                    colour: Colors.white,
                    text: '1. anfac s ubkoi',
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
                    onPress: getImage3,
                    cardChild: _image3 == null
                        ? Icon(Icons.add_a_photo)
                        : Image.file(_image3),
                    colour: Colors.white,
                    text: '3',
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: getImage4,
                    cardChild: _image4 == null
                        ? Icon(Icons.add_a_photo)
                        : Image.file(_image4),
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
                    onPress: getImage5,
                    cardChild: _image5 == null
                        ? Icon(Icons.add_a_photo)
                        : Image.file(_image5),
                    colour: Colors.white,
                    text: '5',
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: getImage6,
                    cardChild: _image6 == null
                        ? Icon(Icons.add_a_photo)
                        : Image.file(_image6),
                    colour: Colors.white,
                    text: '6',
                  ),
                ),
                Expanded(
                  child: AddPhotosContainer(
                    onPress: getImage7,
                    cardChild: _image7 == null
                        ? Icon(Icons.add_a_photo)
                        : Image.file(_image7),
                    colour: Colors.white,
                    text: '7',
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'submit',
            ),
          ), //TOdo: submit button and data to database
        ],
      ),
    );
  }
}
