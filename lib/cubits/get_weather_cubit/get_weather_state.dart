import 'package:weather_app_setup/models/weather_model.dart';

class WeatherStaste {}

class WeatherInitialState extends WeatherStaste {}

class WeatherLoadingState extends WeatherStaste {
  final WeatherModel weatherModel;

  WeatherLoadingState(this.weatherModel);
}

class WWeatherFailureState extends WeatherStaste {}
