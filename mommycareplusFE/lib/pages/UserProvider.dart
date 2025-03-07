import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = "";
  String _age = "";
  String _postpartum = "";

  String get name => _name;
  String get age => _age;
  String get postpartum => _postpartum;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setAge(String age) {
    _age = age;
    notifyListeners();
  }

  void setPostpartum(String postpartum) {
    _postpartum = postpartum;
    notifyListeners();
  }
}
