import 'package:flutter/material.dart';

class GuardianProvider with ChangeNotifier {
  String _guardianName = '';
  String _guardianEmail = '';
  String _guardianContact = '';

  String get guardianName => _guardianName;
  String get guardianEmail => _guardianEmail;
  String get guardianContact => _guardianContact;

  void updateGuardian(String name, String email, String contact) {
    _guardianName = name;
    _guardianEmail = email;
    _guardianContact = contact;
    notifyListeners();  // Notify listeners to update the UI
  }
}
