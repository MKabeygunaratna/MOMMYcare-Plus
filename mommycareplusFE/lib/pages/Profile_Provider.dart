import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  String _babyName = '';
  String _location = '';
  File? _profileImage;

  // Getters
  String get babyName => _babyName;
  String get location => _location;
  File? get profileImage => _profileImage;

  ProfileProvider() {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // Load simple string values
    _babyName = prefs.getString('babyName') ?? '';
    _location = prefs.getString('location') ?? '';

    // The image path needs to be stored and loaded differently
    final imagePath = prefs.getString('profileImagePath');
    if (imagePath != null && imagePath.isNotEmpty) {
      _profileImage = File(imagePath);
    }

    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('babyName', _babyName);
    await prefs.setString('location', _location);

    if (_profileImage != null) {
      await prefs.setString('profileImagePath', _profileImage!.path);
    }
  }

  // Initialize profile with default values or loaded values
  void initProfile({
    required String babyName,
    required String location,
    File? profileImage,
  }) {
    _babyName = babyName;
    _location = location;
    _profileImage = profileImage;
    _saveToPrefs();
    notifyListeners();
  }

  // Update profile data
  void updateProfile({
    required String babyName,
    required String location,
    File? profileImage,
  }) {
    _babyName = babyName;
    _location = location;
    _profileImage = profileImage;
    _saveToPrefs();
    notifyListeners();
  }
}