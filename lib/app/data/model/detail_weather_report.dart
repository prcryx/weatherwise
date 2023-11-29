import 'package:weatherwise/app/data/model/weather_report.dart';
import 'package:weatherwise/app/utils/datetime_utils.dart';
import 'package:weatherwise/app/utils/weather_condition_analysis_util.dart';

import '../../../constants/app_constants.dart';
import '../../utils/weather_code_formatter.dart';

class Coordinates {
  double lat;
  double long;
  Coordinates({required this.lat, required this.long});
}

class TempRange {
  double max;
  double min;
  TempRange({
    required this.max,
    required this.min,
  });
}

class TodayWeatherReport {
  int? tempNow;
  TempRange? tempRange;
  DateTime? timeNow;
  String? tempNowUnit;
  String? tempMaxUnit;
  String? tempMinUnit;
  WeatherCode weatherCode;
  Coordinates? loc;

  TodayWeatherReport({
    this.tempNow,
    this.tempRange,
    this.timeNow,
    this.tempNowUnit,
    this.tempMaxUnit,
    this.tempMinUnit,
    this.weatherCode = WeatherCode.unknown,
    this.loc,
  });

  static get empty => TodayWeatherReport(weatherCode: WeatherCode.unknown);
}

class SolarEvent {
  final SolarEventType type;
  final DateTime timing;
  const SolarEvent({required this.type, required this.timing});

  static SolarEvent get defaultEvent => SolarEvent(
        type: SolarEventType.sunrise,
        timing: DateTime.now(),
      );
}

class ForecastDays {
  final Day refDay;
  final Day subDay;
  ForecastDays({
    required this.refDay,
    required this.subDay,
  });

  @override
  String toString() {
    return '''
      refDay : $refDay,
      subDay: $subDay,
    ''';
  }
}

class BriefForcastDetails {
  final ForecastDays forecastDays;
  final WeatherCode expWeatherCond;
  final TempCond expTempCond;
  final SolarEvent solarEvent;

  const BriefForcastDetails({
    required this.forecastDays,
    required this.expWeatherCond,
    required this.expTempCond,
    required this.solarEvent,
  });
}

extension BriefForecastDetailExtension on BriefForcastDetails? {
  List<InformedForecast> generateInformedForecast() {
    if (this == null) {
      return <InformedForecast>[];
    }
    List<InformedForecast> details = <InformedForecast>[];
    InformedForecast forecast_1 = _getWeatherCondInformedForecast();
    details.addAll(
      [
        forecast_1,
        forecast_1,
        forecast_1,
      ],
    );
    return details;
  }

  InformedForecast _getWeatherCondInformedForecast() {
    if (this!.forecastDays.subDay == Day.today) {
      String title =
          "Today Brings ${this!.expWeatherCond.toWeatherCondTitleExpression}";
      String subtitle = this!.expWeatherCond.toWeatherCondSubtitleExpression;
      return InformedForecast(title: title, subtitle: subtitle);
    } else if (this!.forecastDays.subDay == Day.tomorrow) {
      String title =
          "${this!.expWeatherCond.toWeatherCondTitleExpression} Ahead";
      String subtitle = this!.expWeatherCond.toWeatherCondSubtitleExpression;
      return InformedForecast(title: title, subtitle: subtitle);
    }
    return InformedForecast.empty;
  }
}

class InformedForecast {
  final String title;
  final String subtitle;
  const InformedForecast({
    required this.title,
    required this.subtitle,
  });

  static InformedForecast get empty =>
      const InformedForecast(title: "", subtitle: "");
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
    if (index != AppConstants.invalidIndex) {
      // return this!.daily!.weathercode![index];
      return TodayWeatherReport(
        tempNow: this!.current?.temperature2m?.round(),
        tempRange: TempRange(
          max: this!.daily!.temperature2mMax![index],
          min: this!.daily!.temperature2mMin![index],
        ),
        tempMaxUnit: this!.dailyUnits!.temperature2mMax,
        tempMinUnit: this!.dailyUnits!.temperature2mMin,
        tempNowUnit: this!.currentUnits!.temperature2m,
        weatherCode: this!.daily!.weathercode![index].toWeatherCodeEnum(),
        loc: Coordinates(
          lat: this!.latitude!,
          long: this!.longitude!,
        ),
      );
    }
    return TodayWeatherReport.empty;
  }

  BriefForcastDetails? getBriefForcastDetails() {
    int index = getTodayIndex();
    if (index != AppConstants.invalidIndex) {
      bool showTomorrowReport = DateTime.now().passHourThreshold(14);
      print("showTomorroeReport$showTomorrowReport");
      int compareIndex = 0;

      if (showTomorrowReport) {
        compareIndex = index + 1;
      } else {
        compareIndex = index - 1;
      }

      TempCond tempCond = _expTempCond(index, compareIndex);
      ForecastDays days = _getDays(index, compareIndex);
      print(days);
      WeatherCode expectedWeatherCond = _getWeatherCode(index, compareIndex);
      SolarEvent nextSolarEvent = _getNextSolarEvent(index, compareIndex);

      return BriefForcastDetails(
        forecastDays: days,
        expWeatherCond: expectedWeatherCond,
        expTempCond: tempCond,
        solarEvent: nextSolarEvent,
      );
    }
    return null;
  }

  SolarEvent _getNextSolarEvent(index, compareIndex) {
    if (index > compareIndex) {
      /// show today's solar event
      if (this!.daily!.sunrise != null) {
        DateTime? sunriseTiming = DateTime.parse(this!.daily!.sunrise![index]);
        if (!sunriseTiming.passCurrentTime()) {
          return SolarEvent(
            type: SolarEventType.sunrise,
            timing: sunriseTiming,
          );
        }
      }

      /// if sunrise already happened return sunset event
      /// check if sunset list exists
      if (this!.daily!.sunset != null) {
        DateTime? sunsetTiming = DateTime.parse(this!.daily!.sunset![index]);
        return SolarEvent(
          type: SolarEventType.sunset,
          timing: sunsetTiming,
        );
      }

      /// for unknown reason, if sunrise and sunset list are null
      return SolarEvent.defaultEvent;
    } else {
      /// show tomorrow's solar event, only sunrise
      /// check if sunrise list exists
      if (this!.daily!.sunrise != null) {
        DateTime? sunriseTiming =
            DateTime.parse(this!.daily!.sunset![compareIndex]);
        return SolarEvent(
          type: SolarEventType.sunrise,
          timing: sunriseTiming,
        );
      }
      return SolarEvent.defaultEvent;
    }
  }

  WeatherCode _getWeatherCode(int index, int compareIndex) {
    if (index > compareIndex) {
      return this!.daily!.weathercode![index].toWeatherCodeEnum();
    } else {
      return this!.daily!.weathercode![index].toWeatherCodeEnum();
    }
  }

  TempCond _expTempCond(int index, int compareIndex) {
    TempRange compareTempRange = TempRange(max: 0, min: 0);

    TempRange tempRangeToday = TempRange(
      max: this!.daily!.temperature2mMax![index],
      min: this!.daily!.temperature2mMin![index],
    );

    compareTempRange = TempRange(
      max: this!.daily!.temperature2mMax![compareIndex],
      min: this!.daily!.temperature2mMin![compareIndex],
    );

    if (compareIndex < index) {
      /// yesterday
      return tempRangeToday.compare(compareTempRange);
    } else {
      /// tomorrow
      return compareTempRange.compare(tempRangeToday);
    }
  }

  ForecastDays _getDays(int index, int compareIndex) {
    if (index > compareIndex) {
      return ForecastDays(refDay: Day.yesterday, subDay: Day.today);
    } else {
      return ForecastDays(refDay: Day.today, subDay: Day.tomorrow);
    }
  }
}
