import 'package:flutter/material.dart';
import 'info_screen.dart';

class ResultScreen extends StatelessWidget {
  final String gender;
  final double weight;
  final double height;
  final double bmi;

  const ResultScreen({
    Key? key,
    required this.gender,
    required this.weight,
    required this.height,
    required this.bmi,
  }) : super(key: key);

  String getClassification() {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obesity';
  }

  @override
  Widget build(BuildContext context) {
    final classification = getClassification();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your body'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => InfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BMI Calculator', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),

            // Imagem posicionada como na tela de entrada
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Opacity(
                      opacity: gender == 'Male' ? 1.0 : 0.4,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/male.png'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Male', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: gender == 'Female' ? 1.0 : 0.4,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/female.png'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Female', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 32),

            // Peso e altura centralizados
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Weight (kg)', style: TextStyle(fontSize: 18)),
                        Text(weight.toStringAsFixed(1), style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  SizedBox(width: 24),
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Height (cm)', style: TextStyle(fontSize: 18)),
                        Text(height.toStringAsFixed(1), style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),

            // Resultado do IMC
            Center(
              child: Column(
                children: [
                  Text('Your BMI', style: TextStyle(fontSize: 20)),
                  Text(bmi.toStringAsFixed(1), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Text(classification, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),

            SizedBox(height: 48),

            // Link para calcular novamente
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Calculate BMI again', style: TextStyle(fontSize: 16, color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}