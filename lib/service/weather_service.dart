import 'dart:convert';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/API_key.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = Api_key;
  final String cityName = 'Ranchi';

  Future<WeatherModel> fetchWeather(String city) async{
   final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apiKey}&units=metric");

   final response = await http.get(url);

   if(response.statusCode == 200){
     return WeatherModel.fromJson(jsonDecode(response.body));
   }else{
     throw Exception("Failed to Load Data");
   }
  }
}