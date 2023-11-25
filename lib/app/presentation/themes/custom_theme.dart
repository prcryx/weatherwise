import 'package:flutter/material.dart';

class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  final Color? scaffoldBackground;
  final LinearGradient? dayBackgroundGradient;
  final LinearGradient? afternoonBackgroundGradient;
  final LinearGradient? eveningBackgroundGradient;
  final LinearGradient? nightBackgroundGradient;
  CustomColorTheme({
    this.scaffoldBackground,
    this.dayBackgroundGradient,
    this.afternoonBackgroundGradient,
    this.eveningBackgroundGradient,
    this.nightBackgroundGradient,
  });
  @override
  CustomColorTheme copyWith({
    Color? scaffoldBackground,
    LinearGradient? dayBackgroundGradient,
    LinearGradient? afternoonBackgroundGradient,
    LinearGradient? eveningBackgroundGradient,
    LinearGradient? nightBackgroundGradient,
  }) {
    return CustomColorTheme(
      scaffoldBackground: scaffoldBackground,
      dayBackgroundGradient: dayBackgroundGradient,
      afternoonBackgroundGradient: afternoonBackgroundGradient,
      eveningBackgroundGradient: eveningBackgroundGradient,
      nightBackgroundGradient: nightBackgroundGradient,
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
    );
  }
}
