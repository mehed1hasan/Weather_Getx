import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:weather_getx/app/modules/weather_show/controllers/weather_show_controller.dart';
import 'package:flutter/material.dart';


class TodaysWeather extends StatelessWidget {


  TodaysWeather({super.key, required this.weatherController});

  final WeatherShowController weatherController;

  WeatherType getWeatherType(String condition) {
    print("Current Weather Condition: ${condition}***************");
    if(weatherController.weatherList.value.current?.isDay == 1){
      if(condition == "text.SUNNY") return WeatherType.sunny;
      if(condition == "Overcast") return WeatherType.overcast;
      if(condition == "Partly cloudy") return WeatherType.cloudy;
      if(condition == "Cloudy") return WeatherType.cloudy;
      if(condition == "Mist") return WeatherType.lightSnow;
      if(condition == "Thunder") return WeatherType.thunder;
      if(condition == "Showers") return WeatherType.middleSnow;
      if(condition == "Rain") return WeatherType.heavyRainy;
      if(condition == "Clear") return WeatherType.sunny;

    }
    else{
      if(condition == "Sunny") return WeatherType.sunny;
      if(condition == "Overcast") return WeatherType.overcast;
      if(condition == "Partly cloudy") return WeatherType.cloudyNight;
      if(condition == "Cloudy") return WeatherType.cloudyNight;
      if(condition == "Mist") return WeatherType.lightSnow;
      if(condition == "Thunder") return WeatherType.thunder;
      if(condition == "Showers") return WeatherType.middleSnow;
      if(condition == "Rain") return WeatherType.heavyRainy;
      if(condition == "Clear") return WeatherType.sunnyNight;

    }
    return WeatherType.middleSnow;
  }


  @override
  Widget build(BuildContext context) {

    print(weatherController.weatherList.value.current!.condition!.icon.toString().trim().toLowerCase().replaceAll("//", "https://"));
    return Stack(
      children: [

        WeatherBg(
          weatherType: getWeatherType(weatherController.weatherList.value.current!.condition!.text!.toString()),
          width: MediaQuery.of(context).size.width,
          height: 300,
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      /// City Name
                      Text(
                        "${weatherController.weatherList.value.location?.name.toString()}",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.white
                        ),
                      ),
                      //SizedBox(height: 10,),
                      /// Date
                      Text(
                          DateFormat.yMMMMEEEEd().format(DateTime.parse(
                              weatherController.weatherList.value.current?.lastUpdated.toString() ??
                                  "")),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: CupertinoColors.white
                            //foreground: Paint()..shader = shader,
                          )
                      ),
                    ],
                  ),
                ),
                //const SizedBox(height: 5,),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white12,
                            shape: BoxShape.circle
                          ),
                          /// Icon Show
                          child: Image.network(
                            weatherController.weatherList.value.current!.condition!.icon.toString().trim().toLowerCase().replaceAll("//", "https://"),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            /// Temperature Show
                            Text(
                              "${weatherController.weatherList.value.current?.tempC?.round().toString()}°C",
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                            /// Temperature Condition Show
                            Text(
                             "${ weatherController.weatherList.value.current?.condition?.text}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Feel Like",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "${weatherController.weatherList.value.current?.feelslikeC?.round().toString()}°C",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 15,),
                          const Text(
                            "Humidity",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "${weatherController.weatherList.value.current?.humidity?.round().toString()}%",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Wind",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "${weatherController.weatherList.value.current?.windKph?.round().toString()} kmph",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 15,),
                          const Text(
                            "Visibility",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "${weatherController.weatherList.value.current?.visKm?.round().toString()} km",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
        )
      ],
    );
  }

}



/*

Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${controller.weatherList.value.location?.name.toString()}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${controller.weatherList.value.current?.tempC.toString()} °C",
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ],
              ),
            ),

* */