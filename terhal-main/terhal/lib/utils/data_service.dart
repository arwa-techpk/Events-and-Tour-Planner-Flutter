import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:terhal/models/weather_model.dart';


class DataService {
  Future<Weather> getWeather(String City) async {
    final WeatherQuery = {
      'q': City,
      'appid': 'e59c1cabe268c4d2a287171de15a109c',
      'units': 'metric'
    };
//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', WeatherQuery);

    final Response = await http.get(uri);

    print(Response.body);
    final jason = jsonDecode(Response.body);

    return Weather.fromMap(jason);
  } //end weather

}
