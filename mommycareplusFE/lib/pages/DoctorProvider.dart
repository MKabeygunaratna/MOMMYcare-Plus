import 'package:flutter/material.dart';

class DoctorProvider with ChangeNotifier {
  String _name = '';
  String _contactNumber = '';
  String _email = '';

  // Getters
  String get name => _name;
  String get contactNumber => _contactNumber;
  String get email => _email;

  // Initialize doctor data
  void initDoctor({
    required String name,
    required String contactNumber,
    required String email,
  }) {
    _name = name;
    _contactNumber = contactNumber;
    _email = email;
    notifyListeners();
  }

  // Update doctor data
  void updateDoctor({
    required String name,
    required String contactNumber,
    required String email,
  }) {
    _name = name;
    _contactNumber = contactNumber;
    _email = email;
    notifyListeners();
  }
}