import 'package:flutter/material.dart';
import 'package:weatherwise/app/presentation/themes/app_color.dart';
import 'package:weatherwise/app/presentation/themes/custom_theme.dart';

CustomColorTheme dayTheme = CustomColorTheme(
  backgroundGradient: const LinearGradient(
    colors: [AppColor.azure400, AppColor.azure500, AppColor.azure300],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
CustomColorTheme nightTheme = CustomColorTheme(
  backgroundGradient: const LinearGradient(
    colors: [
      AppColor.ceruleanBlue700,
      AppColor.ceruleanBlue500,
      AppColor.ceruleanBlue400
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
