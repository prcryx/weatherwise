import 'package:weatherwise/app/data/model/detail_weather_report.dart';

enum TempCond {
  similar,
  littleCooler,
  colder,
  littleHotter,
  hotter,
  unknown,
}

enum Day {
  yesterday,
  today,
  tomorrow,
}

enum SolarEventType {
  sunrise,
  sunset,
}

extension TempConditionExtension on TempRange {
  TempCond compare(TempRange compareThan) {
    double maxDifference = compareThan.max - max;
    double minDifference = compareThan.min - min;

    if (maxDifference.abs() <= 2 && minDifference.abs() <= 2) {
      return TempCond.similar;
    } else if (maxDifference < 0 && minDifference < 0) {
      return TempCond.littleCooler;
    } else if (maxDifference < 0 && minDifference >= 0) {
      return TempCond.colder;
    } else if (maxDifference >= 0 && minDifference < 0) {
      return TempCond.littleHotter;
    } else if (maxDifference >= 0 && minDifference >= 0) {
      return TempCond.hotter;
    } else {
      return TempCond.unknown;
    }
  }
}
