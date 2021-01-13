import 'package:flutter/material.dart';
import 'package:star_smile/scans.dart';
import 'package:star_smile/patient_details.dart';
import 'package:star_smile/photos.dart';
import 'package:star_smile/plan_of_treatment.dart';
import 'package:star_smile/x-ray_and_CT.dart';

class Home extends StatelessWidget {
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
                    Navigator.pop(context);
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
    );
  }
}
