import 'package:flutter/material.dart';
import 'package:star_smile/home.dart';
import 'package:star_smile/main.dart';
import 'package:star_smile/photos.dart';
import 'package:star_smile/plan_of_treatment.dart';
import 'package:star_smile/scans.dart';
import 'package:star_smile/x-ray_and_CT.dart';
import 'package:validators/validators.dart' as validator;
import 'package:cloud_firestore/cloud_firestore.dart';

enum Gender { Male, Female, Other }

class PatientDetails extends StatefulWidget {
  static String id = 'patient_details';
  String userid;
  String surename;
  String name;
  String fatherName;
  String dateOfBirth;
  String age;
  String comment;
  String mobileNo;
  String email;
  int indexOfGender;
  PatientDetails({
    this.userid,
    this.surename,
    this.name,
    this.fatherName,
    this.dateOfBirth,
    this.age,
    this.comment,
    this.mobileNo,
    this.email,
    this.indexOfGender,
  });

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final surenameTextController = TextEditingController();
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Gender selectedGender = Gender.values[widget.indexOfGender];
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
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
              onPressed: null,
              child: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, PlanOfTreatment.id);
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
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            InputTextField(
              text: widget.surename,
              controller: surenameTextController,
              onChanged: (value) {
                widget.surename = value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Surename';
                }
                return null;
              },
              maxLines: 1,
            ),
            InputTextField(
              text: widget.name,
              onChanged: (value) {
                widget.name = value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Name';
                }
                return null;
              },
              maxLines: 1,
            ),
            InputTextField(
              text: widget.fatherName,
              onChanged: (value) {
                widget.fatherName = value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Father Name';
                }
                return null;
              },
              maxLines: 1,
            ),
            Text('Gender'),
            ListTile(
              title: Text('Male'),
              leading: Radio(
                activeColor: Colors.black,
                value: Gender.Male,
                groupValue: selectedGender,
                onChanged: (Gender value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Female'),
              leading: Radio(
                activeColor: Colors.black,
                value: Gender.Female,
                groupValue: selectedGender,
                onChanged: (Gender value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Other'),
              leading: Radio(
                activeColor: Colors.black,
                value: Gender.Other,
                groupValue: selectedGender,
                onChanged: (Gender value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InputTextField(
                    text: widget.dateOfBirth,
                    onChanged: (value) {
                      widget.dateOfBirth = value;
                    },
                    keyboardType: TextInputType.datetime,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Date of Birth';
                      }
                      return null;
                    },
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  flex: 2,
                  child: InputTextField(
                    text: widget.age,
                    onChanged: (value) {
                      widget.age = value;
                    },
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Age';
                      }
                      return null;
                    },
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            InputTextField(
              text: widget.comment,
              maxLines: 3,
              onChanged: (value) {
                widget.comment = value;
              },
            ),
            InputTextField(
              text: widget.mobileNo,
              onChanged: (value) {
                widget.mobileNo = value;
              },
              keyboardType: TextInputType.phone,
            ),
            InputTextField(
              text: widget.email,
              onChanged: (value) {
                widget.email = value;
              },
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                if (value.isEmpty == false) {
                  if (!validator.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }
                return null;
              },
              maxLines: 1,
            ),
            FlatButton(
              onPressed: () async {
                try {
                  if (_formKey.currentState.validate() &&
                      widget.userid == null) {
                    await db.collection('patient_details').add({
                      'surename': widget.surename,
                      'name': widget.name,
                      'fatherName': widget.fatherName,
                      'gender': selectedGender.index,
                      'dateOfBirth': widget.dateOfBirth,
                      'age': widget.age,
                      'comment': widget.comment,
                      'mobileNo': widget.mobileNo,
                      'email': widget.email,
                    });
                    print(widget.userid);
                    print('add');
                    surenameTextController.clear(); // not needed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  } else if (_formKey.currentState.validate() &&
                      widget.userid != null) {
                    await db
                        .collection('patient_details')
                        .doc(widget.userid)
                        .update({
                      'surename': widget.surename,
                      'name': widget.name,
                      'fatherName': widget.fatherName,
                      'gender': selectedGender.index,
                      'dateOfBirth': widget.dateOfBirth,
                      'age': widget.age,
                      'comment': widget.comment,
                      'mobileNo': widget.mobileNo,
                      'email': widget.email,
                    });
                    print('update');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  }
                  ;
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'submit',
              ),
            ), // no needed
          ],
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  InputTextField({
    this.text,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.controller,
    this.maxLines,
  });

  final String text;
  final Function onChanged;
  final Function validator;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: controller,
        maxLines: maxLines,
      ),
    );
  }
}
