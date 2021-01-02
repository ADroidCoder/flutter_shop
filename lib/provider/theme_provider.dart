import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  MaterialColor _primarySwatch = Colors.pink;

  MaterialColor get primarySwatch => _primarySwatch;

  set primarySwatch(MaterialColor color) {
    _primarySwatch = color;
    notifyListeners();
  }

  List<Color> _appBarColor = <Color>[Color(0xFFEA3D87), Color(0xFFFF7095)];

  List<Color> get appBarColor => _appBarColor;

  set appBarColor(List<Color> value) {
    _appBarColor = value;
    notifyListeners();
  }
}
