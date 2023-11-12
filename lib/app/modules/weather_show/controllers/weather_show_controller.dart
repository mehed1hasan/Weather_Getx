import 'package:get/get.dart';

import '../../../data/remote/model/weather_model.dart';
import '../../../data/remote/repository/weather_repository.dart';

class WeatherShowController extends GetxController {
  //TODO: Implement WeatherShowController



  final weatherList = WeatherModel().obs;

  @override
  void onInit() {
    fetchData("Dhaka");
  }

  final weatheList = WeatherModel().obs;
  final isLoading = true.obs;

  fetchData(String searchText) async{
    isLoading(true);
    print("************${searchText} Controller Class");
    final receiveData = await WeatherRepository().apicall(searchText);

    // weatherList.update((change) { change?.current = receiveData.current;});
    weatherList.value = receiveData;
    weatherList.refresh();

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
