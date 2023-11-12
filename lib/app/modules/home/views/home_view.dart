/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blue),
            title:  Text('Flutter Weather App ${controller.isLoading.value}'),
            //centerTitle: true,
            actions: [

              /// Search Icon
             */
/* IconButton(
                  onPressed: () {}, icon: Icon(Icons.search_rounded))*//*

            ],
          ),
          body: controller.isLoading.value? Center(child: CircularProgressIndicator(),)
          : SafeArea(
            child: Center(
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
          ));
    });
  }
}
*/
