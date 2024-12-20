import 'package:flutter/material.dart';
import 'screens/guardian_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guardian Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GuardianInfoScreen(),
    );
  }
}
