import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/screens/settings.dart';
import 'package:weather_app/main.dart';

String defaultCity = 'Ranchi';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final bool isFahrenheit;
  final VoidCallback onOpenMenu;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.isFahrenheit,
    required this.onOpenMenu,
  });

  @override
  State<HomeScreen> createState() => _WeatherappHomepage();
}

class _WeatherappHomepage extends State<HomeScreen>{

  final WeatherService _weatherService = WeatherService() ;
  WeatherModel? _weatherModel;

  bool isLoading = false;

  void getData() async{
    setState(() {
      isLoading = true;
    });

    try{
      final weather = await _weatherService.fetchWeather(latitude, longitude);
      setState(() {
        _weatherModel = weather;
        isLoading = false;
      });
    } catch (e){
      print("REAL ERROR: $e");
      setState(() {
        isLoading = false;
      });
      //isLoading = false;

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error Fetching Data"))
      );
    }

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext Context){

    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final clear1 =
    widget.isDarkMode
        ? const Color(0xFF0F2027)
        : Colors.blue;

    final clear2 =
    widget.isDarkMode
        ? const Color(0xFF203A43)
        : Colors.white;

    final clear3 =
    widget.isDarkMode
        ? Colors.blueGrey
        : Colors.grey;

    //[Colors.blueGrey, Colors.white, Colors.indigo]
    final rain1 =
    widget.isDarkMode
        ? const Color(0xFF0F2027)
        : Colors.blueGrey;

    final rain2 =
    widget.isDarkMode
        ? const Color(0xFF203A43)
        : Colors.white;

    final rain3 =
    widget.isDarkMode
        ? Colors.blueGrey
        : Colors.indigoAccent;

    //[Colors.amberAccent, Colors.cyanAccent, Colors.tealAccent],

    final default1 =
    widget.isDarkMode
        ? const Color(0xFF0F2027)
        : Colors.amberAccent;

    final default2 =
    widget.isDarkMode
        ? const Color(0xFF203A43)
        : Colors.cyanAccent;

    final default3 =
    widget.isDarkMode
        ? Colors.blueGrey
        : Colors.tealAccent;

    /// Color for text
    final blackNwhiteColor =
    widget.isDarkMode
        ? const Color.fromRGBO(255, 255, 255, 0.7) // dark
        : const Color.fromRGBO(0, 0, 0, 0.65); // light

    final containerColor =
    widget.isDarkMode
        ? const Color.fromRGBO(0, 0, 0, 0.65) // light
        : const Color.fromRGBO(255, 255, 255, 0.7); // dark






    final String city = _weatherModel?.cityName??"--"; // Default city set to Ranchi
    final String temperatureUnit = "C";
    final Object temperature = _weatherModel?.currentTemperature.toInt()??"--";
    final String description = _weatherModel?.description??"--";
    final String feelsLike = "${_weatherModel?.feelsLike.toInt()}°${temperatureUnit}";
    final Object maxT = _weatherModel?.highTemperature.toInt() ?? "--";
    final Object minT = _weatherModel?.lowTemperature.toInt()??"--";

    String formatHour(String dateTime) {
      final dt = DateTime.parse(dateTime);
      final hour = dt.hour;

      if (hour == 0) return "12 AM";
      if (hour < 12) return "$hour AM";
      if (hour == 12) return "12 PM";
      return "${hour - 12} PM";
    }

    IconData getWeatherIcon(int code) {
      if (code == 0) return Icons.wb_sunny;
      if (code <= 3) return Icons.cloud;
      if (code >= 51 && code <= 67) return Icons.grain;
      if (code >= 71 && code <= 77) return Icons.ac_unit;
      if (code >= 95) return Icons.flash_on;
      return Icons.cloud_queue;
    }

    Widget buildHourlyForecast(WeatherModel weather) {
      return Container(
        height: 140,
        color: containerColor,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weather.hourlyForecast.length,
          itemBuilder: (context, index) {
            final hour = weather.hourlyForecast[index];

            return Container(
              width: 90,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(formatHour(hour.time), style: TextStyle(color: blackNwhiteColor),),
                  Icon(getWeatherIcon(hour.weatherCode), color: blackNwhiteColor,),
                  Text("${hour.temperature.round()}°", style: TextStyle(color: blackNwhiteColor),),
                ],
              ),
            );
          },
        ),
      );
    }

    Expanded buildContainer(String dataName, Icon dataIcon, String data){
      return Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: _weatherModel != null && _weatherModel!.description.toLowerCase().contains('clear')?Colors.grey.shade100
                        :_weatherModel != null && _weatherModel!.description.toLowerCase().contains('rain')?Colors.indigoAccent.shade100
                        :Colors.tealAccent.shade100,
                    borderRadius: BorderRadius.circular(32)
                ),
                margin: EdgeInsets.fromLTRB(2, 2, 0, 2),
                width: 180, height: 180,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              dataName,
                              style: TextStyle(
                                fontSize: 16,

                              ) ,
                            ),
                            Text('        ')
                          ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                data,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                              Text('        ')
                            ]
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            dataIcon
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                
              ),
      );
    }

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
           toolbarHeight: 10,
           /// App bar Background Color
           backgroundColor: _weatherModel != null && _weatherModel!.description.toLowerCase().contains('clear')?clear1
            :_weatherModel != null && _weatherModel!.description.toLowerCase().contains('rain')?rain1
           :default1,
           elevation: 0,
        ),

        body: Container(

          /// BackGround Gradient
          width: double.infinity,
          height: double.infinity,

          decoration: BoxDecoration(

            /// Background when description == clear
            gradient: _weatherModel != null && _weatherModel!.description.toLowerCase().contains('clear')?LinearGradient(
              colors: [clear1, clear2, clear3],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )

            /// Background when description == Rain
                : _weatherModel != null && _weatherModel!.description.toLowerCase().contains('rain')?LinearGradient(
                colors: [rain1, rain2, rain3],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )

            /// Default Background
                :LinearGradient(
                colors: [default1,default2,default3],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
          ),

          child: Center(
            child: Column(
              children: [
                Row(
                  spacing: 130,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: getData, icon: Icon(Icons.refresh, color: blackNwhiteColor,)),
                    Container(
                      width: 47,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pin_drop_outlined,
                            color: blackNwhiteColor,
                            size:25
                          ),
                          Text(
                              city,
                              style : TextStyle(
                                  color: blackNwhiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                              )
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        print("Menu clicked");
                        widget.onOpenMenu();
                      },

                    )
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              width: 150,
                              height: 140,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(temperature.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: blackNwhiteColor,
                                          fontSize: 67,
                                        ),
                                      ),
                                      Text("°",
                                        style: TextStyle(
                                          color: blackNwhiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 67,
                                        ),
                                      ),
                                      Text(temperatureUnit,
                                        style: TextStyle(
                                          color: blackNwhiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 67,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("High: ${maxT}°C Low: ${minT}°C",
                                    style: TextStyle(
                                      color: blackNwhiteColor,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 230,
                          height: 85,
                          margin: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Text(
                                    description,
                                    style: TextStyle(
                                      color: blackNwhiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  ],
                                )
                              )
                            ],
                          )
                        )
                      ],
                    )
                  ]
                ),

                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: blackNwhiteColor,
                        borderRadius: BorderRadius.circular(32)
                      ),
                      margin: EdgeInsetsGeometry.fromLTRB(8, 38, 8, 16),
                      width: 396,
                      height: 190,

                      child: buildHourlyForecast(_weatherModel!)

                    )
                  ],
                ),

                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,

                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildContainer('Feels Like',
                                Icon(
                                  Icons.emoji_emotions,
                                  size: 75,
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                ),
                                feelsLike),

                            buildContainer('Visibility', Icon(Icons.remove_red_eye_outlined,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.humidity}'),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildContainer('Humidity', Icon(Icons.water_drop,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.humidity}'),

                            buildContainer('Wind Speed', Icon(Icons.air,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.windSpeed}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildContainer('Sunset', Icon(Icons.nights_stay_rounded,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '6:13 PM'),

                            buildContainer('Elevation', Icon(Icons.landscape,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.elevation}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}