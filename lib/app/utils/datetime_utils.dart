import 'package:intl/intl.dart';

extension DateTimeStringer on DateTime {
  get toDDMMMDay => DateFormat('dd MMM, EEEE').format(this);
  get toyyyyMMddWithDashSeperator => DateFormat('yyyy-MM-dd').format(this);
  get toHHmm => DateFormat('hh:mm').format(this);
  get toPeriod => DateFormat('a').format(this);
}

enum DayInterval {
  morning,
  afternoon,
  evening,
  night,
}

extension DateTimeExtensions on DateTime {
  DayInterval getDayInterval() {
    final hour = this.hour;

    if (hour >= 5 && hour < 12) {
      return DayInterval.morning;
    } else if (hour >= 12 && hour < 16) {
      return DayInterval.afternoon;
    } else if (hour >= 16 && hour < 19) {
      return DayInterval.evening;
    } else {
      return DayInterval.night;
    }
  }

  bool passHourThreshold(int threshold) {
    final hour = this.hour;

    if (0 <= hour && hour < threshold) {
      return false;
    } else {
      return true;
    }
  }

  bool passCurrentTime() {
    final dateTime = this;
    final now = DateTime.now();

    if (dateTime.isBefore(now)) {
      return true;
    } else {
      return false;
    }
  }
}
