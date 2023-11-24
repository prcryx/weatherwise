import 'package:flutter/material.dart';
import 'package:weatherwise/app/presentation/themes/weather_theme.dart';
import 'package:weatherwise/constants/app_constants.dart';

import 'app/presentation/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  _setThemeMode() {
    if (DateTime.now().hour > 19) {
      _themeMode = ThemeMode.dark;
    }
  }

  @override
  void initState() {
    super.initState();

    _setThemeMode();
    // setState(() {

    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(extensions: [
        dayTheme,
      ]),
      darkTheme: ThemeData.dark().copyWith(extensions: [
        nightTheme,
      ]),
      themeMode: _themeMode,
      home: const HomePage(),
    );
  }
}
