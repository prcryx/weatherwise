import 'package:weatherwise/app/data/model/weather_report.dart';
import 'package:weatherwise/app/data/model/weather_report_req.dart';
import 'package:weatherwise/app/services/http/http_client.dart';

class HomeRepository {
  final HttpClient _client;
  const HomeRepository(this._client);
  Future<WeatherReport> getWeatherReport(WeatherReportRequest request) async {
    String reqStr =
        "?&current=temperature_2m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto&${request.toUriString()}";
    final response = await _client.get(reqStr);
    print(response);
    return WeatherReport.fromJsonWithConstLatitude(
        response, request.lat, request.long);
  }
}
