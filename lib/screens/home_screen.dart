import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGender = 'Male';
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void calculateBMI() {
    final double? weight = double.tryParse(weightController.text);
    final double? heightCm = double.tryParse(heightController.text);

    if (weight == null || heightCm == null || heightCm == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid values')),
      );
      return;
    }

    final heightM = heightCm / 100;
    final bmi = weight / (heightM * heightM);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          gender: selectedGender,
          weight: weight,
          height: heightCm,
          bmi: bmi,
        ),
      ),
    );
  }

  Widget genderOption(String gender, String imagePath, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Column(
        children: [
          Opacity(
            opacity: isSelected ? 1.0 : 0.4,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          SizedBox(height: 8),
          Text(gender, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                genderOption('Male', 'assets/male.png', selectedGender == 'Male'),
                genderOption('Female', 'assets/female.png', selectedGender == 'Female'),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your weight (kg)', style: TextStyle(fontSize: 18)),
                        TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'e.g. 80'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24),
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your height (cm)', style: TextStyle(fontSize: 18)),
                        TextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'e.g. 175'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 48), // ajusta a distância entre os campos e o botão
            Center(
              child: ElevatedButton(
                onPressed: calculateBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text('Calculate your BMI', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}