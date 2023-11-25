import 'package:flutter/material.dart';
import 'package:weatherwise/app/presentation/themes/app_color.dart';
import 'package:weatherwise/app/presentation/themes/custom_theme.dart';

CustomColorTheme weatherTheme = CustomColorTheme(
  scaffoldBackground: AppColor.transparent,

  dayBackgroundGradient: const LinearGradient(
    colors: [
      AppColor.azure400,
      AppColor.azure500,
      AppColor.azure300,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  afternoonBackgroundGradient: const LinearGradient(
    colors: [
      AppColor.hotOrange,
      AppColor.afternoon,
      AppColor.azure500,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  eveningBackgroundGradient: const LinearGradient(
    colors: [
      AppColor.hotOrange,
      AppColor.gingerbread,
      AppColor.indivioletSunset,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  nightBackgroundGradient: const LinearGradient(
    colors: [
      AppColor.midNightBlue,
      AppColor.ceruleanBlue,
      AppColor.blueberry,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
