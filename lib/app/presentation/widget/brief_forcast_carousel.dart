import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weatherwise/app/presentation/themes/custom_theme.dart';
import 'package:weatherwise/app/presentation/widget/spacers.dart';

import '../../../constants/layout_constants.dart';
import '../../data/model/detail_weather_report.dart';
import 'primary_container.dart';

class BriefForcastCarousel extends StatefulWidget {
  final BriefForcastDetails? details;
  const BriefForcastCarousel({
    super.key,
    required this.details,
  });

  @override
  State<BriefForcastCarousel> createState() => _BriefForcastCarouselState();
}

class _BriefForcastCarouselState extends State<BriefForcastCarousel> {
  late PageController pageController;
  late List<InformedForecast> forecasts;
  @override
  void initState() {
    pageController = PageController();
    forecasts = widget.details.generateInformedForecast();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BriefForcastCarousel oldWidget) {
    pageController = PageController();
    forecasts = widget.details.generateInformedForecast();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Container(
        decoration: _cardShape(context),
        padding: const EdgeInsets.all(LayoutConstants.dimen_16),
        height: LayoutConstants.dimen_96,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: forecasts.length,
                controller: pageController,
                itemBuilder: (context, i) => Column(
                  children: [
                    contentCard(
                      context,
                      forecasts[i].title,
                      forecasts[i].subtitle,
                    ),
                  ],
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                dotColor: Theme.of(context)
                    .extension<CustomColorTheme>()!
                    .primaryIconColor!
                    .withOpacity(0.1),
                activeDotColor: Theme.of(context)
                    .extension<CustomColorTheme>()!
                    .primaryIconColor!,
                spacing: LayoutConstants.dimen_8,
                dotHeight: LayoutConstants.dimen_4,
                dotWidth: LayoutConstants.dimen_4,
                type: WormType.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  ShapeDecoration _cardShape(BuildContext context) {
    return ShapeDecoration(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LayoutConstants.dimen_16),
          side: BorderSide(
              color: Theme.of(context)
                  .extension<CustomColorTheme>()!
                  .primaryCardBorderColor!)),
      color:
          Theme.of(context).extension<CustomColorTheme>()!.todayWeatherCardBg,
      shadows: [
        Theme.of(context).extension<CustomColorTheme>()!.primaryCardBoxShadow!
      ],
    );
  }

  Widget contentCard(BuildContext context, String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: LayoutConstants.dimen_16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context)
                .extension<CustomColorTheme>()!
                .primaryTextColor,
          ),
        ),
        const XSVSpacer(),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: LayoutConstants.dimen_14,
            fontWeight: FontWeight.normal,
            color: Theme.of(context)
                .extension<CustomColorTheme>()!
                .primaryTextColor,
          ),
        ),
        const XSVSpacer(),
      ],
    );
  }
}
