import 'dart:convert';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/API_key.dart';
import 'package:weather_app/screens/HomeScreen.dart';
import 'package:weather_app/screens/settings.dart';
import 'package:http/http.dart' as http;

final String apiKey = Api_key;
String cityName = defaultCity;
double latitude = 23.34316;
double longitude = 85.3094;

class LocationService{
  Future<Location> getLatlon(String city) async{
    final url = Uri.parse("https://geocoding-api.open-meteo.com/v1/search?name=${city}&count=1");

    final response = await http.get(url);

    if(response.statusCode == 200){
      return Location.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to Load Data");
    }
  }
}

class WeatherService {
  Future<WeatherModel> fetchWeather(double lat, double lon) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
          '?latitude=$lat'
          '&longitude=$lon'
          '&current=temperature_2m,apparent_temperature,relative_humidity_2m,weather_code,wind_speed_10m'
          '&hourly=temperature_2m,weather_code'
          '&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset'
          '&timezone=auto'
          '&forecast_days=1',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data, cityName);
    } else {
      throw Exception("Failed to Load Data: ${response.statusCode}");
    }
  }
}