import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app_setup/models/weather_model.dart';
import 'package:weather_app_setup/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStaste> {
  GetWeatherCubit() : super(WeatherInitialState());

  late WeatherModel weatherModel;

  getWeather({required String cityName}) async {
    try {
       weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(city: cityName);
      emit(WeatherLoadingState());
    } catch (e) {
      emit(WWeatherFailureState());
    }
  }
}
