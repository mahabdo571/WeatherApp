import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_weather_state.dart';
import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStaste> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

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
