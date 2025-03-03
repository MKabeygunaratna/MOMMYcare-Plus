import 'package:flutter/material.dart';
import 'screens/access_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOMMYcare+',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Sans',
      ),
      home: const AccessScreen(),
    );
  }
}
