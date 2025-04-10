import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_setup/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'e9f73241b8994800849122247230912';

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1',
      );

      return WeatherModel.fromJson(response.data);
    } catch (e) {
      log('Error fetching weather data: $e');
      rethrow;
    }
  }
}
