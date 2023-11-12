/*
import 'package:get/get.dart';
import 'package:weather_getx/app/data/remote/model/weather_model.dart';
import 'package:weather_getx/app/data/remote/repository/weather_repository.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController

  final weatherList = WeatherModel().obs;

  @override
  void onInit() {
    fetchData();
  }

  final weatheList = WeatherModel().obs;
  final isLoading = true.obs;

  fetchData() async{
    isLoading(true);
    final receiveData = await WeatherRepository().apicall();
    weatherList.value = receiveData;
    print(receiveData);
    print(weatherList.value.current!.tempC.toString());
    isLoading(false);
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
*/
