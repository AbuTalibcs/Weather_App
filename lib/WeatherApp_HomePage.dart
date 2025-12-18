//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherappHomepage extends StatefulWidget{
  const WeatherappHomepage({super.key});

  @override
  State<WeatherappHomepage> createState(){
    return _WeatherappHomepage();
  }
}
var text_stlye = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Color.fromRGBO(0, 0, 0, 0.7)
);
Color mycolor = Colors.white;
Color icon_color = Color.fromRGBO(0, 0, 0, 0.5);
var tempUnit = "C";
double today_width = 65;

class _WeatherappHomepage extends State<WeatherappHomepage>{
  @override
  Widget build(BuildContext Context){

    TextStyle temp_style_today = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 21,
        color: Color.fromRGBO(0, 0, 0, 0.5)
    );
    TextStyle time_style_today = TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color.fromRGBO(0, 0, 0, 0.6)
    );

    TextStyle text_stlye = TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Color.fromRGBO(0, 0, 0, 0.7)
    );

    var city = 'Ranchi';
    var tempData = "15";
    var w_disc = "Clear";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.from(alpha: 1, red: 0.95, green: 0.95, blue: 0.95),
         appBar: AppBar(
           toolbarHeight: 10,
           backgroundColor: Color.from(alpha: 1, red: 0.95, green: 0.95, blue: 0.95),
           elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                spacing: 130,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, color: icon_color,size: 27,),
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
                  Icon(Icons.settings, color: icon_color, size: 27,)
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
                                    Text(tempData,
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
                                Text("High: 15°C Low: 10°C",
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
                        //color: Colors.blue,
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
                                  Text(
                                    "Feels like 18°C",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.6),
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
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 3
                      ),
                      borderRadius: BorderRadius.circular(32)
                    ),
                    margin: EdgeInsetsGeometry.fromLTRB(8, 38, 8, 16),
                    width: 396,
                    height: 190,

                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("15°C", style: temp_style_today,),
                                  Icon(Icons.cloud, color: icon_color,),
                                  Text("Now", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("15°C", style: temp_style_today,),
                                  Icon(Icons.cloud, color: icon_color,),
                                  Text("1PM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("14°C", style: temp_style_today,),
                                  Icon(Icons.cloud, color: icon_color,),
                                  Text("3PM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("12°C", style: temp_style_today,),
                                  Icon(Icons.cloudy_snowing, color: icon_color,),
                                  Text("5PM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("12°C", style: temp_style_today,),
                                  Icon(Icons.cloudy_snowing, color: icon_color,),
                                  Text("7PM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("11°C", style: temp_style_today,),
                                  Icon(Icons.water_drop, color: icon_color,),
                                  Text("9PM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("11°C", style: temp_style_today,),
                                  Icon(Icons.water_drop, color: icon_color,),
                                  Text("11PM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("10°C", style: temp_style_today,),
                                  Icon(Icons.thunderstorm, color: icon_color,),
                                  Text("1AM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("8°C", style: temp_style_today,),
                                  Icon(Icons.cloud, color: icon_color,),
                                  Text("3AM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("8°C", style: temp_style_today,),
                                  Icon(Icons.cloud, color: icon_color,),
                                  Text("5AM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("9°C", style: temp_style_today,),
                                  Icon(Icons.water_drop, color: icon_color,),
                                  Text("7AM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("11°C", style: temp_style_today,),
                                  Icon(Icons.thunderstorm, color: icon_color,),
                                  Text("9AM", style: time_style_today,)
                                ],
                              ),
                            ),
                            Container(
                              width: today_width,
                              padding: EdgeInsets.fromLTRB(0,5, 0, 5),
                              margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("10°C", style: temp_style_today,),
                                  Icon(Icons.thunderstorm, color: icon_color,),
                                  Text("11AM", style: time_style_today,)
                                ],
                              ),
                            ),
                          ],
                        )
                  )
                ],
              ),

              Row(
                children: [
                  Container( // Container For Weekly forecaste
                    color: Color.from(alpha: 1, red: 0.95, green: 0.95, blue: 0.95),
                    margin: EdgeInsetsGeometry.fromLTRB(8, 0, 8, 8),
                    width: 396,
                    height: 400,
                    child : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: mycolor,
                          ),
                          padding: EdgeInsetsGeometry.all(24),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                    'Monday',
                                    style: text_stlye
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.thunderstorm, color: icon_color),// 1. wb_sunny 2.water_dropped 3.thunderstrome_out 4 cloud 5 cloude_snow 6. sunny_snow 7. snow
                                    Text("15°C",
                                      style: text_stlye,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: mycolor,
                            ),
                            padding: EdgeInsetsGeometry.all(24),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                      'Tuesday',
                                      style: text_stlye
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.water_drop, color: icon_color),// 1. wb_sunny 2.water_dropped 3.thunderstrome_out 4 cloud 5 cloude_snow 6. sunny_snow 7. snow
                                      Text("10°C",
                                        style: text_stlye,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: mycolor,
                            ),
                            padding: EdgeInsetsGeometry.all(24),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                      'Wednessday',
                                      style: text_stlye
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.cloudy_snowing, color: icon_color),// 1. wb_sunny 2.water_dropped 3.thunderstrome_out 4 cloud 5 cloude_snow 6. sunny_snow 7. snow
                                      Text("8°C",
                                        style: text_stlye,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: mycolor,
                            ),
                            padding: EdgeInsetsGeometry.all(24),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                      'Thursday',
                                      style: text_stlye
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.cloud, color: icon_color),// 1. wb_sunny 2.water_dropped 3.thunderstrome_out 4 cloud 5 cloude_snow 6. sunny_snow 7. snow
                                      Text("11°C",
                                        style: text_stlye,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: mycolor,
                            ),
                            padding: EdgeInsetsGeometry.all(24),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                      'Friday',
                                      style: text_stlye
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.cloud, color: icon_color),// 1. wb_sunny 2.water_dropped 3.thunderstrome_out 4 cloud 5 cloude_snow 6. sunny_snow 7. snow
                                      Text("11°C",
                                        style: text_stlye,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: mycolor,
                            ),
                            padding: EdgeInsetsGeometry.all(24),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                      'Saturday',
                                      style: text_stlye
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.wb_sunny, color: icon_color),// 1. wb_sunny 2.water_dropped 3.thunderstrome_out 4 cloud 5 cloude_snow 6. sunny_snow 7. snow
                                      Text("13°C",
                                        style: text_stlye,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: mycolor,
                            ),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            padding: EdgeInsetsGeometry.all(24),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                      'Sunnday',
                                      style: text_stlye
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.wb_sunny, color: icon_color),// 1. wb_sunny 2.water_dropped 3.thunderstrome_out 4 cloud 5 cloude_snow 6. sunny_snow 7. snow
                                      Text("14°C",
                                        style: text_stlye,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    )
                  )
                ],
              )
            ]
          ),
        )
      ),
    );
  }
}