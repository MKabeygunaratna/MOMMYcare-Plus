import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorProvider with ChangeNotifier {
  String _name = '';
  String _contactNumber = '';
  String _email = '';

  // Getters
  String get name => _name;
  String get contactNumber => _contactNumber;
  String get email => _email;

  DoctorProvider(){
    _loadFromPrefs();
  }

  Future<void>_loadFromPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('doctorName')??'';
    _contactNumber = prefs.getString('doctorContact')??'';
    _email = prefs.getString('doctorEmail')??'';
    notifyListeners();
  }
  Future<void>_saveToPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('doctorName', _name);
    await prefs.setString('doctorContact', _contactNumber);
    await prefs.setString('doctorEmail', _email);
  }


  // Initialize doctor data
  void initDoctor({
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

  // Update doctor data
  void updateDoctor({
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