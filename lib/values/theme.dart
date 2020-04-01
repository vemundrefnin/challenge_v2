import 'package:flutter/material.dart';


final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.blueGrey[700],
  brightness: Brightness.dark,
  backgroundColor: Colors.blueGrey[600],
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.blueGrey[700]),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);