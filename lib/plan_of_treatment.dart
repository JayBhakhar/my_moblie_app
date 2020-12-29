import 'package:flutter/material.dart';

class PlanOfTreatment extends StatefulWidget {
  @override
  _PlanOfTreatmentState createState() => _PlanOfTreatmentState();
}

class _PlanOfTreatmentState extends State<PlanOfTreatment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'plan of treantment',
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('1. first mcq'),
        ],
      ),
    );
  }
}
