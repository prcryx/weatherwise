class WeatherReportRequest {
  final double long;
  final double lat;
  final int pastDays;
  const WeatherReportRequest({
    required this.long,
    required this.lat,
    required this.pastDays,
  });

  toUriString() => 'latitude=$lat&longitude=$long&past_days=$pastDays';
}
