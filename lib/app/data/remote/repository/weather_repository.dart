
import 'package:http/http.dart' as http;


import '../model/weather_model.dart';

String baseUrl = "http://api.weatherapi.com/v1/forecast.json?key=6fd21321022a49a49a9103849230811";

class WeatherRepository{


  Future<WeatherModel> apicall(String searchText) async{
    print("************${searchText} Repository Class");
    final response = await http.get(Uri.parse("$baseUrl&q=$searchText&days=7"));
    return weatherModelFromJson(response.body);
  }
}