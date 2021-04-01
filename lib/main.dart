import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(
    BmiCalculator(),
  );
}

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0D22),
        scaffoldBackgroundColor: Color(0xff0E1337),
      ),
      home: InputPage(),
    );
  }
}
