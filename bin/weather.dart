class Weather {
  const Weather({
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
  });
  final double minTemp;
  final double maxTemp;
  final double temp;
  factory Weather.fromJson(Map<String, Object?> json) => Weather(
        minTemp: json['temp_min'] as double,
        maxTemp: json['temp_max'] as double,
        temp: json['temp'] as double,
      );

  @override
  String toString() => '''
Current Temp: ${temp.toStringAsFixed(0)}°C
Daily Min:    ${minTemp.toStringAsFixed(0)}°C
Daily Max:    ${maxTemp.toStringAsFixed(0)}°C
      ''';
}
