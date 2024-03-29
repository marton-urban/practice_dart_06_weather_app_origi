import 'dart:io';

import 'weather_api_client.dart';

Future<void> main(List<String> arguments) async {
  late final String city;
  // print('Syntax: dart bin/main.dart London');
  if (arguments.length != 1) {
    city = 'London';
  } else {
    city = arguments.first;
  }
  final api = WeatherApiClient();
  try {
    final weather = await api.fetchWeather(city);
    print(weather);
  } on WeatherApiException catch (e) {
    print(e.message);
  } on SocketException catch (_) {
    print('Could not fetch data. Check your connection.');
  } catch (e) {
    print(e);
  }
}
