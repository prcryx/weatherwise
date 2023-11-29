import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

enum WeatherCode {
  clearSky,
  overcast,
  foggy,
  rainy,
  snowy,
  rainyThunderstrom,
  unknown,
}

class WeatherCodeStringConstants {
  const WeatherCodeStringConstants._();
  static const clearSky = "Clear Sky";
  static const overcast = "Cloudy";
  static const foggy = "Foggy";
  static const rainy = "Rainy";
  static const snowy = "Snowy";
  static const rainyThunderstrom = "Thunderstrom";
  static const unknown = "";
}

class WeatherCondTitleExpression {
  const WeatherCondTitleExpression._();
  static const clearSky = "Bright Sunny Skies";
  static const overcast = "Overcast Skies"; // Today Brings a Cloudy Canvas
  static const foggy = "Mystical Foggy Ambiance";
  static const rainy = "Refreshing Rainfall Showers";
  static const snowy = "Snowy Splendor";
  static const rainyThunderstrom = "Thunderous Storm Showers";
  static const unknown = "";
}

class WeatherCondSubtitleTitleExpression {
  const WeatherCondSubtitleTitleExpression._();
  static const clearSky = "Anticipate another perfect sunny day";
  static const overcast = "Brings a cloudy canvas and cozy indoor vibes";
  static const foggy = "Serene atmosphere for quiet moments indoors";
  static const rainy = "Enjoy the soothing sound of raindrops indoors";
  static const snowy = "Awaits magical wonderland for outdoor activities";
  static const rainyThunderstrom = "Enjoy, but stay indoors and be cautious";
  static const unknown = "";
}

extension WeatherCodeEnumExtension on int? {
  WeatherCode toWeatherCodeEnum() {
    if (this == null) {
      return WeatherCode.unknown;
    }
    switch (this) {
      case 0:
        return WeatherCode.clearSky;
      case 1:
      case 2:
      case 3:
        return WeatherCode.overcast;
      case 45:
      case 48:
      case 51:
      case 53:
      case 56:
      case 57:
        return WeatherCode.foggy;
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
        return WeatherCode.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCode.snowy;
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCode.rainyThunderstrom;
      default:
        return WeatherCode.unknown;
    }
  }
}

extension WeatherCodeUtilExtension on WeatherCode? {
  IconData get getWeatherIcon {
    int currentHr = DateTime.now().hour;
    if (currentHr > 17) {
      switch (this) {
        case WeatherCode.clearSky:
          return WeatherIcons.night_clear;
        case WeatherCode.overcast:
          return WeatherIcons.night_partly_cloudy;
        case WeatherCode.foggy:
          return WeatherIcons.night_fog;
        case WeatherCode.snowy:
          return WeatherIcons.night_snow;
        case WeatherCode.rainy:
          return WeatherIcons.rain;
        case WeatherCode.rainyThunderstrom:
          return WeatherIcons.thunderstorm;
        default:
          return WeatherIcons.na;
      }
    } else {
      switch (this) {
        case WeatherCode.clearSky:
          return WeatherIcons.day_sunny;
        case WeatherCode.overcast:
          return WeatherIcons.day_cloudy;
        case WeatherCode.foggy:
          return WeatherIcons.day_fog;
        case WeatherCode.snowy:
          return WeatherIcons.day_snow;
        case WeatherCode.rainy:
          return WeatherIcons.rain;
        case WeatherCode.rainyThunderstrom:
          return WeatherIcons.thunderstorm;
        default:
          return WeatherIcons.na;
      }
    }
  }

  String get weatherCodeString {
    switch (this) {
      case WeatherCode.clearSky:
        return WeatherCodeStringConstants.clearSky;
      case WeatherCode.overcast:
        return WeatherCodeStringConstants.overcast;
      case WeatherCode.foggy:
        return WeatherCodeStringConstants.foggy;
      case WeatherCode.snowy:
        return WeatherCodeStringConstants.snowy;
      case WeatherCode.rainy:
        return WeatherCodeStringConstants.rainy;
      case WeatherCode.rainyThunderstrom:
        return WeatherCodeStringConstants.rainyThunderstrom;
      default:
        return WeatherCodeStringConstants.unknown;
    }
  }

  String get toWeatherCondTitleExpression {
    switch (this) {
      case WeatherCode.clearSky:
        return WeatherCondTitleExpression.clearSky;
      case WeatherCode.overcast:
        return WeatherCondTitleExpression.overcast;
      case WeatherCode.foggy:
        return WeatherCondTitleExpression.foggy;
      case WeatherCode.snowy:
        return WeatherCondTitleExpression.snowy;
      case WeatherCode.rainy:
        return WeatherCondTitleExpression.rainy;
      case WeatherCode.rainyThunderstrom:
        return WeatherCondTitleExpression.rainyThunderstrom;
      default:
        return WeatherCondTitleExpression.unknown;
    }
  }

  String get toWeatherCondSubtitleExpression {
    switch (this) {
      case WeatherCode.clearSky:
        return WeatherCondSubtitleTitleExpression.clearSky;
      case WeatherCode.overcast:
        return WeatherCondSubtitleTitleExpression.overcast;
      case WeatherCode.foggy:
        return WeatherCondSubtitleTitleExpression.foggy;
      case WeatherCode.snowy:
        return WeatherCondSubtitleTitleExpression.snowy;
      case WeatherCode.rainy:
        return WeatherCondSubtitleTitleExpression.rainy;
      case WeatherCode.rainyThunderstrom:
        return WeatherCondSubtitleTitleExpression.rainyThunderstrom;
      default:
        return WeatherCondSubtitleTitleExpression.unknown;
    }
  }
}
