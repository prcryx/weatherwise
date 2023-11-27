import 'package:weatherwise/app/utils/datetime_format.dart';

import '../../../constants/app_constants.dart';

class WeatherReport {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;
  DailyUnits? dailyUnits;
  Daily? daily;

  WeatherReport({
    required this.latitude,
    required this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.dailyUnits,
    this.daily,
  });

  WeatherReport.fromJsonWithConstLatitude(
      Map<String, dynamic> json, double lat, double long) {
    latitude = json['latitude'] ?? latitude;
    longitude = json['longitude'] ?? longitude;
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits = json['current_units'] != null
        ? CurrentUnits.fromJson(json['current_units'])
        : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    dailyUnits = json['daily_units'] != null
        ? DailyUnits.fromJson(json['daily_units'])
        : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }

  String toString() {
    return '''
      Latitude: $latitude
      Longitude: $longitude
      Generation Time (ms): $generationtimeMs
      UTC Offset (seconds): $utcOffsetSeconds
      Timezone: $timezone
      Timezone Abbreviation: $timezoneAbbreviation
      Elevation: $elevation
      Current Units: ${currentUnits.toString()}
      Current Data: $current
      Daily Units: $dailyUnits
      Daily Data: \n\t${daily.toString()}
    ''';
  }
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2m;

  CurrentUnits({this.time, this.interval, this.temperature2m});

  CurrentUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
  }

  @override
  String toString() {
    return '''
      time : $time,
      interval: $interval,
      tempurature2m: $temperature2m,
    ''';
  }
}

class Current {
  String? time;
  int? interval;
  double? temperature2m;

  Current({this.time, this.interval, this.temperature2m});

  Current.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
  }

  @override
  String toString() {
    return '''
      time : $time,
      interval: $interval,
      tempurature2m: $temperature2m,
    ''';
  }
}

class DailyUnits {
  String? time;
  String? weathercode;
  String? temperature2mMax;
  String? temperature2mMin;
  String? sunrise;
  String? sunset;

  DailyUnits(
      {this.time,
      this.weathercode,
      this.temperature2mMax,
      this.temperature2mMin,
      this.sunrise,
      this.sunset});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    weathercode = json['weathercode'];
    temperature2mMax = json['temperature_2m_max'];
    temperature2mMin = json['temperature_2m_min'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  @override
  String toString() {
    return '''
      time : $time,
      weathercode: $weathercode,
      temperature2mMax: $temperature2mMax,
      temperature2mMin: $temperature2mMin,
      sunrise: $sunrise,
      sunset: $sunset,
    ''';
  }
}

class Daily {
  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<String>? sunrise;
  List<String>? sunset;

  Daily({
    this.time,
    this.weathercode,
    this.temperature2mMax,
    this.temperature2mMin,
    this.sunrise,
    this.sunset,
  });

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    weathercode = json['weathercode'].cast<int>();
    temperature2mMax = json['temperature_2m_max'].cast<double>();
    temperature2mMin = json['temperature_2m_min'].cast<double>();
    sunrise = json['sunrise'].cast<String>();
    sunset = json['sunset'].cast<String>();
  }

  @override
  String toString() {
    return '''
      time : $time,
      weathercode: $weathercode,
      temperature2mMax: $temperature2mMax,
      temperature2mMin: $temperature2mMin,
      sunrise: $sunrise,
      sunset: $sunset,
    ''';
  }
}

class Coordinates {
  double lat;
  double long;
  Coordinates({required this.lat, required this.long});
}

class TodayWeatherReport {
  int? tempNow;
  double? tempMax;
  double? tempMin;
  DateTime? timeNow;
  String? tempNowUnit;
  String? tempMaxUnit;
  String? tempMinUnit;
  int? weatherCode;
  Coordinates? loc;

  TodayWeatherReport({
    this.tempNow,
    this.tempMax,
    this.tempMin,
    this.timeNow,
    this.tempNowUnit,
    this.tempMaxUnit,
    this.tempMinUnit,
    this.weatherCode,
    this.loc,
  });

  static get empty =>
      TodayWeatherReport(weatherCode: AppConstants.unknownWeatherCode);
}

extension WeatherReportExtensions on WeatherReport? {
  int getTodayIndex() {
    if (this == null) {
      return AppConstants.invalidIndex;
    } else {
      if (this!.daily != null) {
        int index = 0;
        DateTime now = DateTime.now();
        if (this!.daily!.time != null) {
          index = this!.daily!.time!.indexOf(now.toyyyyMMddWithDashSeperator);
          return index;
        }
      }
    }
    return AppConstants.invalidIndex;
  }

  TodayWeatherReport getTodayWeatherReport() {
    int index = getTodayIndex();
    print("weatherIndex: $index");
    if (index != AppConstants.invalidIndex) {
      // return this!.daily!.weathercode![index];
      return TodayWeatherReport(
        tempNow: this!.current?.temperature2m?.round(),
        tempMax: this!.daily!.temperature2mMax![index],
        tempMin: this!.daily!.temperature2mMin![index],
        tempMaxUnit: this!.dailyUnits!.temperature2mMax,
        tempMinUnit: this!.dailyUnits!.temperature2mMin,
        tempNowUnit: this!.currentUnits!.temperature2m,
        weatherCode: this!.daily!.weathercode![index],
        loc: Coordinates(
          lat: this!.latitude!,
          long: this!.longitude!,
        ),
      );
    }
    return TodayWeatherReport.empty;
  }
}
