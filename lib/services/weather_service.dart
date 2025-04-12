import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

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
    }on DioException catch (e) {
     final String errorMessage = e.response?.data['error']['message'] ?? 'Unknown error';
      log('Error fetching weather data: $errorMessage', error: e);
      throw Exception(errorMessage);
    }catch(e) {
      log('Error fetching weather data: $e');
      throw Exception('Failed to load weather data');
    }
  }
}
