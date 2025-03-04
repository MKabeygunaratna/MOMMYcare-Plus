import 'package:flutter/material.dart';

void main() {
  runApp(VaccinationFormApp());
}

class VaccinationFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VaccinationFormScreen(),
    );
  }
}

class VaccinationFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Vaccination Form Screen"),
      ),
    );
  }
}
