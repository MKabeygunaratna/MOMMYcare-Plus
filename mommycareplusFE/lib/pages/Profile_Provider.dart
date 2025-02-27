import 'package:flutter/material.dart';
import 'dart:io';

class ProfileProvider with ChangeNotifier {
  String _name = '';
  String _babyName = '';
  String _location = '';
  File? _profileImage;

  // Getters
  String get name => _name;
  String get babyName => _babyName;
  String get location => _location;
  File? get profileImage => _profileImage;

  // Initialize profile with default values or loaded values
  void initProfile({
    required String name,
    required String babyName,
    required String location,
    File? profileImage,
  }) {
    _name = name;
    _babyName = babyName;
    _location = location;
    _profileImage = profileImage;
    notifyListeners();
  }

  // Update profile data
  void updateProfile({
    required String name,
    required String babyName,
    required String location,
    File? profileImage,
  }) {
    _name = name;
    _babyName = babyName;
    _location = location;
    _profileImage = profileImage;
    notifyListeners();
  }
}