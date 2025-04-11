import 'package:flutter/material.dart';
import 'package:weather_app_setup/views/search_view.dart';
import 'package:weather_app_setup/widgets/no_weather_body.dart';
import 'package:weather_app_setup/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: weatherModel == null ? const NoWeatherBody() : const WeatherInfoBody(),
    );
  }
}
