import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:star_smile/main.dart';
import 'package:star_smile/scans.dart';
import 'package:star_smile/patient_details.dart';
import 'package:star_smile/photos.dart';
import 'package:star_smile/plan_of_treatment.dart';
import 'package:star_smile/x-ray_and_CT.dart';

final _firestore = FirebaseFirestore.instance;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Smile'),
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
      body: Column(
        children: [PatientDetailsStream()],
      ),
    );
  }
}

class PatientDetailsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('patient_details').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final patients = snapshot.data.docs;
        List<PatientList> patientsList = [];
        for (var patient in patients) {
          final patientID = patient.reference.id;
          final surenameText = patient.data()['surename'];
          final nameText = patient.data()['name'];
          final fatherNameText = patient.data()['fatherName'];
          final genderIndex = patient.data()['gender'];
          final dateOfBirthText = patient.data()['dateOfBirth'];
          final ageText = patient.data()['age'];
          final commentText = patient.data()['comment'];
          final mobileNoText = patient.data()['mobileNo'];
          final emailText = patient.data()['email'];

          final patientData = PatientList(
            id: patientID,
            name: nameText,
            surename: surenameText,
            fatherName: fatherNameText,
            gender: genderIndex,
            dateOfBirth: dateOfBirthText,
            age: ageText,
            comment: commentText,
            mobileNo: mobileNoText,
            email: emailText,
          );
          patientsList.add(patientData);
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            children: patientsList,
          ),
        );
      },
    );
  }
}

class PatientList extends StatelessWidget {
  PatientList({
    this.id,
    this.name,
    this.surename,
    this.fatherName,
    this.gender,
    this.dateOfBirth,
    this.age,
    this.comment,
    this.mobileNo,
    this.email,
  });
  final String id;
  final String name;
  final String surename;
  final String fatherName;
  final int gender;
  final String dateOfBirth;
  final String age;
  final String comment;
  final String mobileNo;
  final String email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Patient(
                id: id,
                name: name,
                surename: surename,
                fatherName: fatherName,
                gender: gender,
                dateOfBirth: dateOfBirth,
                age: age,
                comment: comment,
                mobileNo: mobileNo,
                email: email,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '$name $surename',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Patient extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  Patient({
    this.id,
    this.name,
    this.surename,
    this.fatherName,
    this.gender,
    this.dateOfBirth,
    this.age,
    this.comment,
    this.mobileNo,
    this.email,
  });
  String id;
  String name;
  final String surename;
  final String fatherName;
  final int gender;
  final String dateOfBirth;
  final String age;
  final String comment;
  final String mobileNo;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('patient'),
      ),
      body: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: name,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              onChanged: (value) {
                name = value;
              }),
          Text('Surename : $surename'),
          Text('Name : $name'),
          Text('Father Name : $fatherName'),
          Builder(builder: (context) {
            if (gender == 0)
              return Text('Gender : Male');
            else if (gender == 1)
              return Text('Gender : Female');
            else
              return Text('Gender : Other');
          }),
          Text('Date of Birth : $dateOfBirth'),
          Text('age : $age'),
          Text('Comment : $comment'),
          Text('Moblie No. : $mobileNo'),
          Text('Email : $email'),
          FlatButton(
            onPressed: () async {
              try {
                if (true) {
                  await db.collection('patient_details').doc(id).update({
                    'name': name,
                  });
                  print('done'); // not needed
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
    );
  }
}
