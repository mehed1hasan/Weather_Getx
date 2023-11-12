import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:weather_getx/app/widget/hourly_weather.dart';
import 'package:weather_getx/app/widget/next_seven_days_weather.dart';
import 'package:weather_getx/app/widget/todays_weather.dart';

import '../controllers/weather_show_controller.dart';

class WeatherShowView extends GetView<WeatherShowController> {
  const WeatherShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    WeatherShowController? weatherController = WeatherShowController();
    final _textController = TextEditingController();

    _showTextInputDialog(BuildContext context) async{
      return showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text("Search Loaction"),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
                hintText: "Search by location"
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: (){

                if(_textController.text.isEmpty){
                  return;
                }

                Navigator.pop(context, _textController.text);
              },
              child: const Text("Ok"),
            )
          ],
        );
      });
    }
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blue),
            title:  const Text('Flutter Weather App'),
            //centerTitle: true,
            actions: [
              /// Search Icon
               IconButton(
                  onPressed: () async{
                    _textController.clear();
                    String text = await _showTextInputDialog(context);
                    weatherController!.fetchData(text);
                  },
                  icon: const Icon(Icons.search_rounded)
               ),
              /// Current Location Icon
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.my_location_outlined)
              ),
            ],
          ),
          body: controller.isLoading.value? const Center(child: CircularProgressIndicator(),)
              : SafeArea(
              child: SizedBox(
              width: double.infinity,
                child: SingleChildScrollView(scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      TodaysWeather(weatherController: controller,),
                      const SizedBox(height: 10,),
                      /// Weather By Hours
                      const Text("Weather By Hours", style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.weatherList.value.forecast?.forecastday?[0].hour?.length,
                          itemBuilder: (context, index){
                            //final hour = controller.weatherList.value.forecast?.forecastday?[0].hour?[index];
                            return HourlyWeather(currentIndex: index, weatherController: controller,);
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      /// Next Seven Day Weather Show
                      const Text("Next 7 Days Weather", style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.weatherList.value.forecast?.forecastday?.length,
                          itemBuilder: (context, index){
                            return NextSevenDaysWeather(currentIndex: index, weatherController: controller,);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            )
          ));
    });
  }
}


