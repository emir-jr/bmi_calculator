import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your body')), // seta de voltar com mesmo título
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24), // espaço para descer o título
            Text('BMI categories', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            Text('Less than 18.5', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("You're underweight.", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('18.5 to 24.9', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("You're normal.", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('25 to 29.9', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("You're overweight.", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('30 or more', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Obesity.", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}