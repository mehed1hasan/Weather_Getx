import 'package:get/get.dart';

import '../controllers/weather_show_controller.dart';

class WeatherShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherShowController>(
      () => WeatherShowController(),
    );
  }
}
