import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather.dart';

class WeatherApiException implements Exception {
  const WeatherApiException(this.message);
  final String message;
}

class WeatherApiClient {
  static const baseUrl = 'https://api.openweathermap.org';

  Future<Weather> fetchWeather(String city) async {
    final weatherUrl = Uri.parse(
        '$baseUrl/data/2.5/weather?q=$city&APPID=3217817010b704d96500b04e78f97f7b&units=metric');
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw WeatherApiException('Error getting weather for location: $city');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    final consolidatedWeather = weatherJson['main'] as Map<String, Object?>;
    if (consolidatedWeather.isEmpty) {
      throw WeatherApiException(
          'Weather data not available for locationId: $city');
    }
    return Weather.fromJson(consolidatedWeather);
  }
}
