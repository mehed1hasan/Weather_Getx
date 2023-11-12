import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashscreenController());
    return Scaffold(
      /*appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue
        ),
      ),*/
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Image.asset(
          'assets/splashImage.png',
          height: 250,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
