import 'package:flutter/material.dart';

class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  final Color? scaffoldBackground;
  final Color? todayWeatherCardBg;
  final Color? primaryIconColor;
  final Color? primaryTextColor;
  final Color? primaryCardBorderColor;
  final BoxShadow? primaryCardBoxShadow;
  final LinearGradient? dayBackgroundGradient;
  final LinearGradient? afternoonBackgroundGradient;
  final LinearGradient? eveningBackgroundGradient;
  final LinearGradient? nightBackgroundGradient;
  CustomColorTheme({
    this.scaffoldBackground,
    this.todayWeatherCardBg,
    this.primaryIconColor,
    this.primaryTextColor,
    this.primaryCardBorderColor,
    this.dayBackgroundGradient,
    this.afternoonBackgroundGradient,
    this.eveningBackgroundGradient,
    this.nightBackgroundGradient,
    this.primaryCardBoxShadow,
  });
  @override
  CustomColorTheme copyWith({
    Color? scaffoldBackground,
    Color? todayWeatherCardBg,
    Color? primaryIconColor,
    Color? primaryTextColor,
    Color? primaryCardBorderColor,
    LinearGradient? dayBackgroundGradient,
    LinearGradient? afternoonBackgroundGradient,
    LinearGradient? eveningBackgroundGradient,
    LinearGradient? nightBackgroundGradient,
    BoxShadow? primaryCardBoxShadow,
  }) {
    return CustomColorTheme(
      scaffoldBackground: scaffoldBackground,
      todayWeatherCardBg: todayWeatherCardBg,
      primaryIconColor: primaryIconColor,
      primaryTextColor: primaryTextColor,
      primaryCardBorderColor: primaryCardBorderColor,
      dayBackgroundGradient: dayBackgroundGradient,
      afternoonBackgroundGradient: afternoonBackgroundGradient,
      eveningBackgroundGradient: eveningBackgroundGradient,
      nightBackgroundGradient: nightBackgroundGradient,
      primaryCardBoxShadow: primaryCardBoxShadow,
    );
  }

  @override
  CustomColorTheme lerp(ThemeExtension<CustomColorTheme>? other, double t) {
    if (other is! CustomColorTheme) {
      return this;
    }
    return CustomColorTheme(
      scaffoldBackground: Color.lerp(
        scaffoldBackground,
        other.scaffoldBackground,
        t,
      ),
      todayWeatherCardBg: Color.lerp(
        todayWeatherCardBg,
        other.todayWeatherCardBg,
        t,
      ),
      primaryIconColor: Color.lerp(
        primaryIconColor,
        other.primaryIconColor,
        t,
      ),
      primaryTextColor: Color.lerp(
        primaryTextColor,
        other.primaryTextColor,
        t,
      ),
      primaryCardBorderColor: Color.lerp(
        primaryCardBorderColor,
        other.primaryCardBorderColor,
        t,
      ),
      dayBackgroundGradient: LinearGradient.lerp(
        dayBackgroundGradient,
        other.dayBackgroundGradient,
        t,
      ),
      afternoonBackgroundGradient: LinearGradient.lerp(
        afternoonBackgroundGradient,
        other.afternoonBackgroundGradient,
        t,
      ),
      eveningBackgroundGradient: LinearGradient.lerp(
        eveningBackgroundGradient,
        other.eveningBackgroundGradient,
        t,
      ),
      nightBackgroundGradient: LinearGradient.lerp(
        nightBackgroundGradient,
        other.nightBackgroundGradient,
        t,
      ),
      primaryCardBoxShadow: BoxShadow.lerp(
        primaryCardBoxShadow,
        other.primaryCardBoxShadow,
        t,
      ),
    );
  }
}
