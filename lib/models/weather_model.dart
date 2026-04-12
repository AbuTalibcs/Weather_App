import 'package:flutter/material.dart';

class WeatherModel {

  final String cityName;
  final double tempretur;
  final double feelsLike;
  final double maxTemp;
  final double minTemp;
  final String discription;
  final int humidity;
  final int sunset;
  final int sunrise;
  final double windSpeed;
  Icon weatherIcon;

  WeatherModel({

    required this.cityName,
    required this.tempretur,
    required this.feelsLike,
    required this.maxTemp,
    required this.minTemp,
    required this.discription,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
    required this.weatherIcon
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    
    return WeatherModel(
        cityName: json['name'],
        tempretur: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        maxTemp: json['main']['temp_max'],
        minTemp: json['main']['temp_min'],
        discription: json['weather']['discription'],
        humidity: json['main']['humidity'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        windSpeed: json['wind']['speed'],
        weatherIcon: json['weather']['icon']
    );

  }


}