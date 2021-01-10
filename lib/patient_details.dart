import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

enum Gender { Male, Female, Other }

class _PatientDetailsState extends State<PatientDetails> {
  final _formKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.Male;
  String surename;

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
              onSaved: (value) {
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
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Name';
                }
                return null;
              },
            ),
            InputTextField(
              text: 'Father Name',
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
            InputTextField(text: 'Comment'),
            InputTextField(
              text: 'Moblie No.',
              keyboardType: TextInputType.phone,
            ),
            InputTextField(
              text: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // _formKey.currentState.save();
                  print('yes');
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
    this.onSaved,
    this.validator,
    this.keyboardType,
  });

  final String text;
  final Function onSaved;
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
        onSaved: onSaved,
        keyboardType: keyboardType,
      ),
    );
  }
}
