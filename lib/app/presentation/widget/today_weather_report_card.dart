import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherwise/app/presentation/themes/custom_theme.dart';
import 'package:weatherwise/app/presentation/widget/spacers.dart';
import 'package:weatherwise/app/utils/datetime_format.dart';
import 'package:weatherwise/app/utils/weather_code_formatter.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/layout_constants.dart';
import '../../data/model/weather_report.dart';
import '../../utils/ttl_utils.dart';
import 'primary_container.dart';

class TodayWeatherReportCard extends StatefulWidget {
  final TodayWeatherReport? todayWeatherReport;
  const TodayWeatherReportCard({
    super.key,
    this.todayWeatherReport,
  });

  @override
  State<TodayWeatherReportCard> createState() => _TodayWeatherReportCardState();
}

class _TodayWeatherReportCardState extends State<TodayWeatherReportCard> {
  late WeatherCode weatherCode;
  late String _timeString;
  late String _timePeriod;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    weatherCode = widget.todayWeatherReport!.weatherCode!.toWeatherCodeEnum();
    DateTime now = DateTime.now();
    _timeString = now.toHHmm;
    _timePeriod = now.toPeriod;
    timer = Timer.periodic(TTLUtils.primaryClockTTL, (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _timeString = now.toHHmm;
      _timePeriod = now.toPeriod;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   setState(() {
  //     weatherCode = widget.todayWeatherReport!.weatherCode!.toWeatherCodeEnum();
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  void didUpdateWidget(covariant TodayWeatherReportCard oldWidget) {
    weatherCode = widget.todayWeatherReport!.weatherCode!.toWeatherCodeEnum();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color:
          Theme.of(context).extension<CustomColorTheme>()!.scaffoldBackground,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Row(
            children: [
              if (weatherCode != WeatherCode.unknown) ...[
                Expanded(
                  child: PrimaryContainer(
                    child: Container(
                      decoration: todayCardShape(context),
                      padding: const EdgeInsets.all(LayoutConstants.dimen_16),
                      child: _body(weatherCode, context),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(WeatherCode weatherCode, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _leftCol(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _showWeatherIcon(weatherCode, context),
                const XSVSpacer(),
                _showTemperatureText(
                  context,
                  Theme.of(context)
                      .extension<CustomColorTheme>()!
                      .primaryTextColor,
                ),
              ],
            ),
          ],
        ),
        const XSVSpacer(),
        _footer(context)
      ],
    );
  }

  Widget _leftCol(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context)
                  .extension<CustomColorTheme>()!
                  .primaryIconColor,
              size: LayoutConstants.dimen_16,
            ),
            Text(
              "Agartala",
              style: TextStyle(
                fontSize: LayoutConstants.dimen_14,
                fontWeight: FontWeight.normal,
                color: Theme.of(context)
                    .extension<CustomColorTheme>()!
                    .primaryTextColor,
              ),
            )
          ],
        ),
        const XSVSpacer(),
        _showTime(context),
      ],
    );
  }

  Widget _showTime(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _timeString,
            style: TextStyle(
              fontSize: LayoutConstants.dimen_48,
              fontWeight: FontWeight.bold,
              color: Theme.of(context)
                  .extension<CustomColorTheme>()!
                  .primaryTextColor,
            ),
          ),
          TextSpan(
            text: _timePeriod.toLowerCase(),
            style: TextStyle(
              fontSize: LayoutConstants.dimen_14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context)
                  .extension<CustomColorTheme>()!
                  .primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Row _footer(BuildContext context) {
    return Row(
      children: [
        Text(
          "Max: ${widget.todayWeatherReport?.tempMax ?? 0}${AppConstants.degreeUnicode}",
          style: TextStyle(
            color: Theme.of(context)
                .extension<CustomColorTheme>()!
                .primaryTextColor,
          ),
        ),
        const XSHSpacer(),
        Text(
          "Min: ${widget.todayWeatherReport?.tempMin ?? 0}${AppConstants.degreeUnicode}",
          style: TextStyle(
            color: Theme.of(context)
                .extension<CustomColorTheme>()!
                .primaryTextColor,
          ),
        )
      ],
    );
  }

  Widget _showWeatherIcon(WeatherCode weatherCode, BuildContext context) {
    return BoxedIcon(
      weatherCode.getWeatherIcon,
      size: LayoutConstants.dimen_48,
      color: Theme.of(context).extension<CustomColorTheme>()!.primaryIconColor,
    );

    // Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Text(
    //       weatherCode.weatherCodeString,
    //       style: TextStyle(
    //         fontSize: LayoutConstants.dimen_16,
    //         fontWeight: FontWeight.w500,
    //         color: Theme.of(context)
    //             .extension<CustomColorTheme>()!
    //             .primaryIconColor,
    //       ),
    //     ),
    //     const MVSpacer()
    //   ],
    // ),
  }

  Widget _showTemperatureText(BuildContext context, Color? color) {
    return LayoutBuilder(builder: (context, constaint) {
      if (widget.todayWeatherReport!.tempNow != null &&
          widget.todayWeatherReport!.tempNowUnit != null) {
        return RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: '${widget.todayWeatherReport!.tempNow}',
              style: TextStyle(
                fontSize: LayoutConstants.dimen_48,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            TextSpan(
              text: '${widget.todayWeatherReport!.tempNowUnit}',
              style: TextStyle(
                fontSize: LayoutConstants.dimen_14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ));
      }
      return Container();
    });
  }

  ShapeDecoration todayCardShape(context, {bool defineArea = true}) {
    return ShapeDecoration(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LayoutConstants.dimen_16),
          side: defineArea
              ? BorderSide(
                  color: Theme.of(context)
                      .extension<CustomColorTheme>()!
                      .primaryCardBorderColor!)
              : BorderSide.none),
      color: defineArea
          ? Theme.of(context).extension<CustomColorTheme>()!.todayWeatherCardBg
          : Theme.of(context).extension<CustomColorTheme>()!.scaffoldBackground,
      shadows: !defineArea
          ? [
              Theme.of(context)
                  .extension<CustomColorTheme>()!
                  .primaryCardBoxShadow!
            ]
          : null,
    );
  }
}
