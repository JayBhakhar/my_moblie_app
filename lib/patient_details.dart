import 'package:flutter/material.dart';
import 'package:star_smile/home.dart';
import 'package:star_smile/plan_of_treatment.dart';
import 'package:validators/validators.dart' as validator;
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

enum Gender { Male, Female, Other }

class _PatientDetailsState extends State<PatientDetails> {
  final surenameTextController = TextEditingController();
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.Male;
  String surename;
  String name;
  String fatherName;
  String dateOfBirth;
  String age;
  String comment;
  String moblieNo;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlanOfTreatment();
                    },
                  ),
                );
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
              text: 'Surename',
              controller: surenameTextController,
              onChanged: (value) {
                surename = value;
                print(surename);
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Surename';
                }
                return null;
              },
            ),
            InputTextField(
              text: 'Name',
              onChanged: (value) {
                name = value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Name';
                }
                return null;
              },
            ),
            InputTextField(
              text: 'Father Name',
              onChanged: (value) {
                fatherName = value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Father Name';
                }
                return null;
              },
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
                    text: 'Date of Birth',
                    onChanged: (value) {
                      dateOfBirth = value;
                    },
                    keyboardType: TextInputType.datetime,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Date of Birth';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  flex: 2,
                  child: InputTextField(
                    text: 'Age',
                    onChanged: (value) {
                      age = value;
                      print(age);
                    },
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Age';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            InputTextField(
              text: 'Comment',
              maxLines: 3,
              onChanged: (value) {
                comment = value;
              },
            ),
            InputTextField(
              text: 'Moblie No.',
              onChanged: (value) {
                moblieNo = value;
              },
              keyboardType: TextInputType.phone,
            ),
            InputTextField(
              text: 'Email',
              onChanged: (value) {
                email = value;
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
            ),
            FlatButton(
              onPressed: () async {
                try {
                  if (_formKey.currentState.validate()) {
                    await db.collection('patient_details').add({
                      'surename': surename,
                      'name': name,
                      'fatherName': fatherName,
                      'gender': selectedGender.toString(),
                      // todo: need to change, Gender.Male should be like Male,Female
                      'dateOfBirth': dateOfBirth,
                      'age': age,
                      'comment': comment,
                      'moblieNo': moblieNo,
                      'email': email,
                    });
                    print('done'); // for check
                    surenameTextController.clear(); // not needed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'submit',
              ),
            ),
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
