import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

String defaultCity = 'Ranchi';

class WeatherappHomepage extends StatefulWidget{
  const WeatherappHomepage({super.key});

  @override
  State<WeatherappHomepage> createState(){
    return _WeatherappHomepage();
  }
}
class _WeatherappHomepage extends State<WeatherappHomepage>{

  final WeatherService _weatherService = WeatherService() ;
  WeatherModel? _weatherModel;

  bool isLoading = false;

  void getData() async{
    setState(() {
      isLoading = true;
    });

    try{
      final weather = await _weatherService.fetchWeather(city);
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

late final String city = _weatherModel?.cityName??"--"; // Default city set to Ranchi
late final String tempUnit = "C";
late final Object temperature = _weatherModel?.temperature.toInt()??"--";
late final String w_disc = _weatherModel?.description??"--";
late final Object feels_like = _weatherModel?.feelsLike.toInt() ?? "--";
late final Object maxT = _weatherModel?.maxTemp.toInt() ?? "--";
late final Object minT = _weatherModel?.minTemp.toInt()??"--";

  @override
  Widget build(BuildContext Context){

    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    Container hourlyForecast(String temperature, Icon icon, String time){
      return Container(
        width: 65,
        padding: EdgeInsets.fromLTRB(0,5, 0, 5),
        margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${temperature}°C",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 21,
                color: Color.fromRGBO(0, 0, 0, 0.5)
              ),
            ),
            icon,
            Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromRGBO(0, 0, 0, 0.6)
                )
            )
          ],
        ),
      );
    }

    Expanded retrunContainer(String dataName, Icon dataIcon, String data){
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
           backgroundColor: _weatherModel != null && _weatherModel!.description.toLowerCase().contains('clear')?Colors.blue
            :_weatherModel != null && _weatherModel!.description.toLowerCase().contains('rain')?Colors.blueGrey
           :Colors.amberAccent,
           elevation: 0,
        ),

        body: Container(

          /// BackGround Gradient
          width: double.infinity,
          height: double.infinity,

          decoration: BoxDecoration(

            /// Background when description == clear
            gradient: _weatherModel != null && _weatherModel!.description.toLowerCase().contains('clear')?LinearGradient(
              colors: [Colors.blue, Colors.white, Colors.grey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )

            /// Background when description == Rain
                : _weatherModel != null && _weatherModel!.description.toLowerCase().contains('rain')?LinearGradient(
                colors: [Colors.blueGrey, Colors.white, Colors.indigo],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )

            /// Default Background
                :LinearGradient(
                colors: [Colors.amberAccent, Colors.cyanAccent, Colors.tealAccent],
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
                    IconButton(onPressed: getData, icon: Icon(Icons.refresh)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pin_drop_outlined,
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                          Text(
                              city,
                              style : TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                              )
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.settings, color: Color.fromRGBO(0, 0, 0, 0.5), size: 27,)
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
                                          color: Color.fromRGBO(0, 0, 0, 0.8),
                                          fontSize: 67,
                                        ),
                                      ),
                                      Text("°",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 67,
                                        ),
                                      ),
                                      Text(tempUnit,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 67,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("High: ${maxT}°C Low: ${minT}°C",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
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
                                    w_disc,
                                    style: TextStyle(
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
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                        borderRadius: BorderRadius.circular(32)
                      ),
                      margin: EdgeInsetsGeometry.fromLTRB(8, 38, 8, 16),
                      width: 396,
                      height: 190,

                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                            children: [
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                              hourlyForecast('8', Icon(Icons.thunderstorm, color: Color.fromRGBO(0, 0, 0, 0.5),), '3'),
                            ],
                          )
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
                            retrunContainer('Feels Like',
                                Icon(
                                  Icons.emoji_emotions,
                                  size: 75,
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                ),
                                '${_weatherModel?.feelsLike}'),

                            retrunContainer('Visibility', Icon(Icons.remove_red_eye_outlined,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.feelsLike}'),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            retrunContainer('Humidity', Icon(Icons.water_drop,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.humidity}'),

                            retrunContainer('Wind Speed', Icon(Icons.air,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.windSpeed}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            retrunContainer('Pressure', Icon(Icons.compress,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.feelsLike}'),

                            retrunContainer('Sea Level', Icon(Icons.landscape,size: 75,
                              color: Color.fromRGBO(0, 0, 0, 0.7),), '${_weatherModel?.feelsLike}'),
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