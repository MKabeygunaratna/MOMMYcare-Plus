import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String _name = "";
  String _age = "";
  String _postpartum = "";

  String get name => _name;
  String get age => _age;
  String get postpartum => _postpartum;

  UserProvider(){
    _loadFromPrefs();
  }

  Future<void>_loadFromPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('userName')??'';
    _age = prefs.getString('userAge')??'';
    _postpartum = prefs.getString('userPostpartumPeriod')??'';
    notifyListeners();
  }

  Future<void>_saveToPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _name);
    await prefs.setString('userAge', _age);
    await prefs.setString('userPostpartumPeriod', _postpartum);
  }

  void setName(String name) {
    _name = name;
    _saveToPrefs();
    notifyListeners();
  }

  void setAge(String age) {
    _age = age;
    _saveToPrefs();
    notifyListeners();
  }

  void setPostpartum(String postpartum) {
    _postpartum = postpartum;
    _saveToPrefs();
    notifyListeners();
  }

  void updateUser({
    required String name,
    required String age,
    required String postpartum,
}){
    _name = name;
    _age = age;
    _postpartum = postpartum;
    _saveToPrefs();
    notifyListeners();
  }
}
