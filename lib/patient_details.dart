import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

enum Gender { Male, Female, Other }

class _PatientDetailsState extends State<PatientDetails> {
  Gender selectedGender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: Column(
        children: [
          InputTextField('Surename'),
          InputTextField('Name'),
          InputTextField('Father Name'),
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
          InputTextField('Date of Birth'),
          InputTextField('Comment'),
          InputTextField('Moblie No.'),
          InputTextField('Email'),
          FlatButton(
            onPressed: () {},
            child: Text(
              'submit',
            ),
          )
        ],
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  InputTextField(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
