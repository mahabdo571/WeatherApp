import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_setup/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: getWeatherColorByDay("partly cloudy"),
          appBarTheme: AppBarTheme(
            backgroundColor: getWeatherColorByDay("partly cloudy"),
            foregroundColor: Colors.black,
          ),
        ),
        home: HomeView(),
      ),
    );
  }

  MaterialColor getWeatherColorByDay(String day) {
    switch (day.toLowerCase()) {
      case "sunny":
        return Colors.amber;
      case "clear":
        return Colors.amber;
      case "partly cloudy":
        return Colors.blueGrey;
      case "cloudy":
        return Colors.grey;
      case "overcast":
        return Colors.blueGrey;
      case "mist":
      case "fog":
      case "freezing fog":
        return Colors.blue;
      case "patchy rain possible":
      case "light rain":
      case "moderate rain":
      case "patchy light rain":
      case "heavy rain":
      case "torrential rain shower":
      case "moderate or heavy rain shower":
      case "patchy light rain with thunder":
      case "moderate or heavy rain with thunder":
        return Colors.indigo;
      case "patchy snow possible":
      case "light snow":
      case "moderate snow":
      case "patchy light snow":
      case "patchy moderate snow":
      case "patchy heavy snow":
      case "heavy snow":
      case "light snow showers":
      case "moderate or heavy snow showers":
      case "patchy light snow with thunder":
      case "moderate or heavy snow with thunder":
        return Colors.cyan;
      case "patchy sleet possible":
      case "light sleet":
      case "moderate or heavy sleet":
      case "light sleet showers":
      case "moderate or heavy sleet showers":
        return Colors.teal;
      case "thundery outbreaks possible":
        return Colors.deepOrange;
      case "ice pellets":
      case "light showers of ice pellets":
      case "moderate or heavy showers of ice pellets":
        return Colors.deepPurple;
      case "blowing snow":
      case "blizzard":
        return Colors.lightBlue;
      case "patchy freezing drizzle possible":
      case "freezing drizzle":
      case "heavy freezing drizzle":
      case "light freezing rain":
      case "moderate or heavy freezing rain":
        return Colors.lightGreen;
      case "patchy light drizzle":
      case "light drizzle":
        return Colors.green;
      case "moderate rain at times":
      case "heavy rain at times":
        return Colors.blue;
      default:
        return Colors.blueGrey;
    }
  }
}
