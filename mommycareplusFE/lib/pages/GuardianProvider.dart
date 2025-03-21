import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuardianProvider with ChangeNotifier {
  String _name = '';
  String _contactNumber = '';
  String _email = '';

  // Getters
  String get name => _name;
  String get contactNumber => _contactNumber;
  String get email => _email;

  GuardianProvider(){
    _loadFromPrefs();
  }
  Future<void>_loadFromPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('guardianName')??'';
    _contactNumber = prefs.getString('guardianContact')??'';
    _email = prefs.getString('guardianEmail')??'';
    notifyListeners();
  }

  Future<void>_saveToPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('guardianName', _name);
    await prefs.setString('guardianContact', _contactNumber);
    await prefs.setString('guardianEmail', _email);
  }

  // Initialize guardian data
  void initGuardian({
    required String name,
    required String contactNumber,
    required String email,
  }) {
    _name = name;
    _contactNumber = contactNumber;
    _email = email;
    _saveToPrefs();
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
    _saveToPrefs();
    notifyListeners();
  }
}