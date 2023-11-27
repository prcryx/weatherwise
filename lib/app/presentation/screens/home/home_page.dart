import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherwise/app/data/model/weather_report.dart';
import 'package:weatherwise/app/presentation/screens/home/bloc/home_cubit.dart';
import 'package:weatherwise/app/presentation/screens/home/bloc/home_state.dart';
import 'package:weatherwise/app/presentation/themes/app_color.dart';
import 'package:weatherwise/app/presentation/themes/custom_theme.dart';
import 'package:weatherwise/app/presentation/widget/spacers.dart';
import 'package:weatherwise/constants/layout_constants.dart';
import 'package:weatherwise/di/injector.dart';

import '../../widget/greeting_text.dart';
import '../../widget/today_weather_report_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _cubit;
  WeatherReport? _report;
  @override
  void initState() {
    _cubit = Injector.resolver<HomeCubit>();
    _cubit.getWeatherReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.scaffoldBackground,
      body: BlocConsumer<HomeCubit, HomeState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is WeatherReportFetchSuccessState) {
              setState(() {
                _report = state.res;
                print("From homepage: ${state.res}");
              });
            }
          },
          builder: (context, state) {
            print("printing _report $_report");
            return Column(
              children: [
                const LVSpacer(),
                GreetingText(),
                const LVSpacer(),
                TodayWeatherReportCard(
                  todayWeatherReport: _report.getTodayWeatherReport(),
                )
              ],
            );
          }),
    );
  }
}
