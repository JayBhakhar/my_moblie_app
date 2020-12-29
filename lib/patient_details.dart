import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
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
          //Todo: add sex with radio button
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
