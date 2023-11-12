import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_getx/app/modules/weather_show/controllers/weather_show_controller.dart';

class NextSevenDaysWeather extends StatelessWidget {
  const NextSevenDaysWeather({super.key, this.currentIndex, this.weatherController});

  final currentIndex;
  final WeatherShowController? weatherController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.network(
                  'https:${weatherController?.weatherList.value.forecast?.forecastday?[currentIndex].day.toString()}',
                ),
              ),
              Expanded(
                child: Text(
                  DateFormat.MMMEd().format(DateTime.parse(weatherController!.weatherList.value.forecast!.forecastday![currentIndex].date.toString())),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: Text(
                  "${weatherController!.weatherList.value.forecast!.forecastday![currentIndex].day!.condition!.text.toString()}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: Text(
                  "^${weatherController!.weatherList.value.forecast!.forecastday![currentIndex].day!.maxtempC?.round().toString()}/"
                      "${weatherController!.weatherList.value.forecast!.forecastday![currentIndex].day!.mintempC?.round().toString()}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          )
        )
      ],
    );;
  }
}
