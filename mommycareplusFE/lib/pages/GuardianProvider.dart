import 'package:flutter/material.dart';

class GuardianProvider with ChangeNotifier {
  String _name = '';
  String _contactNumber = '';
  String _email = '';

  // Getters
  String get name => _name;
  String get contactNumber => _contactNumber;
  String get email => _email;

  // Initialize guardian data
  void initGuardian({
    required String name,
    required String contactNumber,
    required String email,
  }) {
    _name = name;
    _contactNumber = contactNumber;
    _email = email;
    notifyListeners();
  }

  // Update guardian data
  void updateGuardian({
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