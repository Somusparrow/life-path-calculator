import 'package:flutter/material.dart';

class life extends StatefulWidget {
  const life({super.key});

  @override
  State<life> createState() => _lifeState();
}

class _lifeState extends State<life> {
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  int lifePathNumber = 0;

  void calculateLifePath() {
    int birthDay = int.tryParse(dayController.text) ?? 0;
    int birthMonth = int.tryParse(monthController.text) ?? 0;
    int birthYear = int.tryParse(yearController.text) ?? 0;

    int total = birthDay + birthMonth + birthYear;

    if (total == 11 || total == 22) {
      setState(() {
        lifePathNumber = total;
      });
      return;
    }

    while (total > 9) {
      total = total.toString().split('').map(int.parse).reduce((a, b) => a + b);
    }

    setState(() {
      lifePathNumber = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Path Number Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: dayController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Birth Day'),
            ),
            TextField(
              controller: monthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Birth Month'),
            ),
            TextField(
              controller: yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Birth Year'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateLifePath,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Life Path Number: $lifePathNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
