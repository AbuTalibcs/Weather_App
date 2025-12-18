import 'package:flutter/material.dart';
import 'package:weather_app/WeatherApp_HomePage.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget{
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState(){
    return _WeatherApp();
  }
}

class _WeatherApp extends State<WeatherApp>{
  @override
  Widget build(BuildContext Context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherappHomepage(),
    );
  }
}