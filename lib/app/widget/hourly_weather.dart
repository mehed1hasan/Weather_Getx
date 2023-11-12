import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_getx/app/modules/weather_show/controllers/weather_show_controller.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key, this.currentIndex, this.weatherController});

  final currentIndex;
  final WeatherShowController? weatherController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 110,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${weatherController?.weatherList.value.forecast?.forecastday?[0].hour?[currentIndex].tempC?.round().toString()}°C",
                style: const TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle
                ),
                child: Image.network(
                  "https:${weatherController?.weatherList.value.forecast?.forecastday?[0].hour?[currentIndex].condition?.icon}",
                ),
              ),
              Text(
                DateFormat.j().format(DateTime.parse(weatherController!.weatherList.value.forecast!.forecastday![0].hour![currentIndex].time.toString())),
                // "${weatherController?.weatherList.value.forecast?.forecastday?[0].hour?[currentIndex].time.toString()}°C"
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

            ],
          ),
        )
      ],
    );
  }
}

