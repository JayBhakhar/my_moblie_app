import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:star_smile/home.dart';
import 'package:star_smile/patient_details.dart';
import 'package:star_smile/photos.dart';
import 'package:star_smile/plan_of_treatment.dart';
import 'package:star_smile/scans.dart';
import 'package:star_smile/x-ray_and_CT.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: Home(),
      routes: {
        PatientDetails.id: (context) => PatientDetails(surename: 'Surename',name: 'Name',fatherName: 'Fathername',dateOfBirth: 'Date of Birth',age: 'Age',comment: 'Comment',mobileNo:'Mobile No.', email:'Email',),
        PlanOfTreatment.id: (context) => PlanOfTreatment(),
        Photos.id: (context) => Photos(),
        XrayAndCt.id: (context) => XrayAndCt(),
        Scans.id: (context) => Scans(),
      },
    );
  }
}
