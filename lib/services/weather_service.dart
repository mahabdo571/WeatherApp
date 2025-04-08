import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_setup/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=e9f73241b8994800849122247230912&q=$city&days=1',
      );

      return WeatherModel.fromJson(response.data);
    } catch (e) {
      log('Error fetching weather data: $e');
      rethrow;
    }
  }
}
