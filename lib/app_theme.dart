import 'package:weather_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  ///Background, Foreground and Object color
  /// Gradient Colors for clear weather
  static const Color blue =  Colors.blue; // 1. -> !dark
  static const Color darkBlue = Color(0xFF0F2027); // 1. -> dark
  static const Color darkBlueWhite = Color(0xFF2F5A68); //2. -> dark
  static const Color white = Color.fromRGBO(255, 255, 255, 1); //2. -> !dark
  static const Color blueGrey = Colors.blueGrey; //3. -> !dark
  static const Color grey = Colors.grey; // 3. -> dark
  /// Gradient Color for rainy weather
   // 1. darkBlue : if dark mode
   // 1. blueGrey : if !dark mode
   // 2. darkBlue : if dark mode
   // 2. white : if !dark mode
   // 3. blueGrey : if dark mode
  static const Color indigoAccent = Colors.indigoAccent; //3. if !dark mode
  /// Gradient Color for default
  static const Color darkerBlue = Color(0xFF030637); //1. -> darkMode
  static const Color skyBlue = Color(0xFF89D4FF); //1. -> !darkMode
  static const Color maroon = Color(0xFF5D0E41); //2. -> darkMode
  static const Color cyan = Colors.cyanAccent; //2. -> !darkMode
  static const Color darkTeal = Color(0xFF2E4F4F); //3. -> darkMode
  static const Color tealAccent = Colors.tealAccent; //3.-> !darkMode

  static const Color whiteWithOpacity = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color blackWithOpacity = Color.fromRGBO(0, 0, 0, 0.65);

}