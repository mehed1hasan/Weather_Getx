import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_getx/app/routes/app_pages.dart';

import '../../home/views/home_view.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 2),
        () => Get.offNamed(Routes.WEATHER_SHOW)
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
