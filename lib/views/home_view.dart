import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_setup/cubits/get_weather_cubit/get_weather_state.dart';
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
      body: BlocBuilder<GetWeatherCubit, WeatherStaste>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return const WeatherInfoBody();
          } else {
            return const Text("error");
          }
        },
      ),
    );
  }
}
