import 'package:flutter/material.dart';

class WeatherModel {

  final String cityName;
  final double temperature;
  final double feelsLike;
  final double maxTemp;
  final double minTemp;
  String description;
  final double humidity;
  final double sunset;
  final double sunrise;
  final double windSpeed;

 // Icon weatherIcon;

  WeatherModel({

    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.maxTemp,
    required this.minTemp,
    required this.description,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,

    //required this.weatherIcon
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    
    return WeatherModel(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble,
        feelsLike: json['main']['feels_like'],
        maxTemp: json['main']['temp_max'],
        minTemp: json['main']['temp_min'],
        description: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        windSpeed: json['wind']['speed'],

       // weatherIcon: json['weather'][0]['icon']
    );
  }

}