import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherwise/app/presentation/themes/weather_theme.dart';
import 'package:weatherwise/app/utils/datetime_utils.dart';
import 'package:weatherwise/di/injector_config.dart';

import 'app/presentation/screens/home/home_page.dart';
import 'app/presentation/themes/custom_theme.dart';
import 'app/utils/scroll_behavior.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  InjectorConfig.setUp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[
        weatherTheme,
      ]),
      themeMode: ThemeMode.light,
      builder: (context, child) => ScrollConfiguration(
        behavior: MyBehavior(),
        child: _appBuilder(context),
      ),
    );
  }
}

Widget _appBuilder(context) {
  LinearGradient getBackgroundGradient() {
    DateTime now = DateTime.now();

    switch (now.getDayInterval()) {
      case DayInterval.morning:
        return Theme.of(context)
            .extension<CustomColorTheme>()!
            .dayBackgroundGradient!;
      case DayInterval.afternoon:
        return Theme.of(context)
            .extension<CustomColorTheme>()!
            .afternoonBackgroundGradient!;
      case DayInterval.evening:
        return Theme.of(context)
            .extension<CustomColorTheme>()!
            .eveningBackgroundGradient!;

      case DayInterval.night:
        return Theme.of(context)
            .extension<CustomColorTheme>()!
            .nightBackgroundGradient!;
      default:
        return Theme.of(context)
            .extension<CustomColorTheme>()!
            .dayBackgroundGradient!;
    }
  }

  return Container(
    decoration: BoxDecoration(
      gradient: getBackgroundGradient(),
    ),
    child: const HomePage(),
  );
}
