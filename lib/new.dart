import 'package:flutter/material.dart';

void main() {
  runApp(neww());
}

class neww extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Path Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LifePathCalculator(),
    );
  }
}

class LifePathCalculator extends StatefulWidget {
  @override
  _LifePathCalculatorState createState() => _LifePathCalculatorState();
}

class _LifePathCalculatorState extends State<LifePathCalculator> {
  TextEditingController _dobController = TextEditingController();
  String _lifePathNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Path Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _dobController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Enter your date of birth (MM/DD/YYYY)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _lifePathNumber = calculateLifePathNumber(_dobController.text);
                });
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Life Path Number is $_lifePathNumber',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  String calculateLifePathNumber(String dob) {
    // Remove any non-numeric characters from the date of birth
    dob = dob.replaceAll(RegExp(r'[^0-9]'), '');

    // Calculate the life path number
    int sum = 0;
    for (int i = 0; i < dob.length; i++) {
      sum += int.parse(dob[i]);
    }

    while (sum > 9) {
      int temp = 0;
      while (sum > 0) {
        temp += sum % 10;
        sum ~/= 10;
      }
      sum = temp;
    }

    return sum.toString();
  }
}
