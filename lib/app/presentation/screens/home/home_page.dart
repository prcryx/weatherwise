import 'package:flutter/material.dart';
import 'package:weatherwise/app/presentation/themes/app_color.dart';
import 'package:weatherwise/app/presentation/themes/custom_theme.dart';
import 'package:weatherwise/app/presentation/widget/spacers.dart';
import 'package:weatherwise/constants/layout_constants.dart';

import '../../widget/greeting_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.scaffoldBackground,
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: LayoutConstants.dimen_16),
        child: Column(
          children: [
            const LVSpacer(),
            GreetingText(),
            const LVSpacer(),
          ],
        ),
      ),
    );
  }
}
