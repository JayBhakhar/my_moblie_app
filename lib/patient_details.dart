import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

enum Gender { Male, Female, Other }

class _PatientDetailsState extends State<PatientDetails> {
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
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            InputTextField(
              text: 'Surename',
              onChanged: (value) {
                surename = value;
                print(surename); // todo:probebly from here save to database
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
                  flex: 4,
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
                if (!validator.isEmail(value)) {
                  return 'Please enter a valid email';
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
                      'gender': Gender,
                      'dateOfBirth': dateOfBirth,
                      'age': age,
                      'comment': comment,
                      'moblieNo': moblieNo,
                      'email': email,
                    });
                    print('done'); // for check
                  }
                } catch (e) {
                  print(e);
                }
              }, // todo: sent to database
              child: Text(
                'submit',
              ),
            )
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
  });

  final String text;
  final Function onChanged;
  final Function validator;
  final TextInputType keyboardType;

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
      ),
    );
  }
}
