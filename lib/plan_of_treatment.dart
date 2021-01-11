import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanOfTreatment extends StatefulWidget {
  @override
  _PlanOfTreatmentState createState() => _PlanOfTreatmentState();
}

enum FirstAnswers { a, b, c }
enum SecondAnswers { a, b, c, d }
enum ThirdAnswers { a, b }
enum ForthAnswers { a, b }

class _PlanOfTreatmentState extends State<PlanOfTreatment> {
  FirstAnswers selectedAnswer1 = FirstAnswers.a;
  SecondAnswers selectedAnswer2 = SecondAnswers.a;
  ThirdAnswers selectedAnswer3 = ThirdAnswers.a;
  ForthAnswers selectedAnswer4 = ForthAnswers.a;
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'plan of treantment',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text('-------'), // two button , slider button, one button
              ],
            ),
            Text('1. question'),
            ListTile(
              title: Text('option a'),
              leading: Radio(
                activeColor: Colors.black,
                value: FirstAnswers.a,
                groupValue: selectedAnswer1,
                onChanged: (FirstAnswers value) {
                  setState(() {
                    selectedAnswer1 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('option b'),
              leading: Radio(
                activeColor: Colors.black,
                value: FirstAnswers.b,
                groupValue: selectedAnswer1,
                onChanged: (FirstAnswers value) {
                  setState(() {
                    selectedAnswer1 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('option c'),
              leading: Radio(
                activeColor: Colors.black,
                value: FirstAnswers.c,
                groupValue: selectedAnswer1,
                onChanged: (FirstAnswers value) {
                  setState(() {
                    selectedAnswer1 = value;
                  });
                },
              ),
            ),
            Text('2. question'),
            ListTile(
              title: Text('option a'),
              leading: Radio(
                activeColor: Colors.black,
                value: SecondAnswers.a,
                groupValue: selectedAnswer2,
                onChanged: (SecondAnswers value) {
                  setState(() {
                    selectedAnswer2 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('option b'),
              leading: Radio(
                activeColor: Colors.black,
                value: SecondAnswers.b,
                groupValue: selectedAnswer2,
                onChanged: (SecondAnswers value) {
                  setState(() {
                    selectedAnswer2 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('option c'),
              leading: Radio(
                activeColor: Colors.black,
                value: SecondAnswers.c,
                groupValue: selectedAnswer2,
                onChanged: (SecondAnswers value) {
                  setState(() {
                    selectedAnswer2 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('option d'),
              leading: Radio(
                activeColor: Colors.black,
                value: SecondAnswers.d,
                groupValue: selectedAnswer2,
                onChanged: (SecondAnswers value) {
                  setState(() {
                    selectedAnswer2 = value;
                  });
                },
              ),
            ),
            Text('3. question'),
            ListTile(
              title: Text('option a'),
              leading: Radio(
                activeColor: Colors.black,
                value: ThirdAnswers.a,
                groupValue: selectedAnswer3,
                onChanged: (ThirdAnswers value) {
                  setState(() {
                    selectedAnswer3 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('option b'),
              leading: Radio(
                activeColor: Colors.black,
                value: ThirdAnswers.b,
                groupValue: selectedAnswer3,
                onChanged: (ThirdAnswers value) {
                  setState(() {
                    selectedAnswer3 = value;
                  });
                },
              ),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Comment',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              maxLines: 3,
            ),
            Text('4. question'),
            ListTile(
              title: Text('option a'),
              leading: Radio(
                activeColor: Colors.black,
                value: ForthAnswers.a,
                groupValue: selectedAnswer4,
                onChanged: (ForthAnswers value) {
                  setState(() {
                    selectedAnswer4 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('option b'),
              leading: Radio(
                activeColor: Colors.black,
                value: ForthAnswers.b,
                groupValue: selectedAnswer4,
                onChanged: (ForthAnswers value) {
                  setState(() {
                    selectedAnswer4 = value;
                  });
                },
              ),
            ),
            CheckboxListTile(
              title: Text("have a feeling of pain....."),
              activeColor: Colors.black,
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'special intr...',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
