
class Location{
  final double lat;
  final double lon;

  Location({
    required this.lat,
    required this.lon

  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final result = json['results'][0];

    return Location(
      lat: (result['latitude']).toDouble(),
      lon: (result['longitude']).toDouble(),
    );
  }
}

class WeatherModel {
  final String cityName;
  final double currentTemperature;
  final double feelsLike;
  final double highTemperature;
  final double lowTemperature;
  final String description;
  final int humidity;
  final String sunrise;
  final String sunset;
  final double windSpeed;
  final double elevation;
  final List<HourlyForecast> hourlyForecast;

  WeatherModel({
    required this.cityName,
    required this.currentTemperature,
    required this.feelsLike,
    required this.highTemperature,
    required this.lowTemperature,
    required this.description,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
    required this.elevation,
    required this.hourlyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json, String city) {
    final current = json['current'];
    final daily = json['daily'];
    final hourly = json['hourly'];

    List<HourlyForecast> hourlyList = [];

    int count = hourly['time'].length < 24 ? hourly['time'].length : 24;
    for (int i = 0; i < count; i++) {
      hourlyList.add(
        HourlyForecast(
          time: hourly['time'][i],
          temperature: (hourly['temperature_2m'][i]).toDouble(),
          weatherCode: hourly['weather_code'][i],
        ),
      );
    }

    return WeatherModel(
      cityName: city,
      currentTemperature: (current['temperature_2m']).toDouble(),
      feelsLike: (current['apparent_temperature']).toDouble(),
      highTemperature: (daily['temperature_2m_max'][0]).toDouble(),
      lowTemperature: (daily['temperature_2m_min'][0]).toDouble(),
      description: getWeatherDescription(current['weather_code']),
      humidity: current['relative_humidity_2m'],
      sunrise: daily['sunrise'][0],
      sunset: daily['sunset'][0],
      windSpeed: (current['wind_speed_10m']).toDouble(),
      elevation: (json['elevation']).toDouble(),
      hourlyForecast: hourlyList,
    );
  }

  static String getWeatherDescription(int code) {
    if (code == 0) return "Clear Sky";
    if (code == 1) return "Mainly Clear";
    if (code == 2) return "Partly Cloudy";
    if (code == 3) return "Overcast";
    if (code >= 45 && code <= 48) return "Fog";
    if (code >= 51 && code <= 67) return "Rain";
    if (code >= 71 && code <= 77) return "Snow";
    if (code >= 80 && code <= 82) return "Rain Showers";
    if (code >= 95) return "Thunderstorm";
    return "Unknown";
  }
}

class HourlyForecast {
  final String time;
  final double temperature;
  final int weatherCode;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });
}