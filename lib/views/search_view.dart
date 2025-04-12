import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_setup/models/weather_model.dart';
import 'package:weather_app_setup/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search city')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
       //ToDO: implement search functionality
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
              hintText: 'Enter city Name',
              suffixIcon: const Icon(Icons.search),
              labelText: 'Search',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 22,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


