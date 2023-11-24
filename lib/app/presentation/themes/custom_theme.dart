import 'package:flutter/material.dart';

class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  final LinearGradient? backgroundGradient;
  CustomColorTheme({
    this.backgroundGradient,
  });
  @override
  CustomColorTheme copyWith({
    LinearGradient? backgroundGradient,
  }) {
    return CustomColorTheme(backgroundGradient: backgroundGradient);
  }

  @override
  CustomColorTheme lerp(CustomColorTheme? other, double t) {
    if (other is! CustomColorTheme) {
      return this;
    }
    return CustomColorTheme(
      backgroundGradient:
          LinearGradient.lerp(backgroundGradient, other.backgroundGradient, t),
    );
  }
}
