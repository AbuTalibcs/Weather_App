import 'package:flutter/material.dart';
import 'package:weather_app/screens/HomeScreen.dart';
import 'package:weather_app/screens/settings.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  bool isDarkMode = false;
  bool isFahrenheit = false;

  void toggleDarkMode(bool value) {
    setState(() => isDarkMode = value);
  }

  void toggleUnit(bool value) {
    setState(() => isFahrenheit = value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Builder(
        builder: (context) {
          return HomeScreen(
            isDarkMode: isDarkMode,
            isFahrenheit: isFahrenheit,
            onOpenMenu: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MenuScreen(
                    isDarkMode: isDarkMode,
                    isFahrenheit: isFahrenheit,
                    onDarkModeChanged: toggleDarkMode,
                    onUnitChanged: toggleUnit,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}