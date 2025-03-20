import 'package:flutter/material.dart';
import 'dart:io';

class ProfileProvider with ChangeNotifier {
  String _babyName = '';
  String _location = '';
  File? _profileImage;

  // Getters
  String get babyName => _babyName;
  String get location => _location;
  File? get profileImage => _profileImage;

  // Initialize profile with default values or loaded values
  void initProfile({
    required String babyName,
    required String location,
    File? profileImage,
  }) {
    _babyName = babyName;
    _location = location;
    _profileImage = profileImage;
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
    notifyListeners();
  }
}