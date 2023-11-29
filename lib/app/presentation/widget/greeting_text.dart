import 'package:flutter/material.dart';
import 'package:weatherwise/app/utils/datetime_utils.dart';

import '../../../constants/layout_constants.dart';
import '../themes/app_color.dart';
import 'primary_container.dart';
import 'spacers.dart';

class GreetingText extends StatelessWidget {
  final DateTime now;
  GreetingText({super.key}) : now = DateTime.now();

  String getGreeting() {
    int hour = now.hour;

    if (hour < 12) {
      return 'Good\nMorning,';
    } else if (hour < 17) {
      return 'Good\nAfternoon,';
    } else {
      return 'Good\nEvening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Text(
                  getGreeting(),
                  style: const TextStyle(
                    fontSize: LayoutConstants.dimen_42,
                    fontWeight: FontWeight.bold,
                    color: AppColor.snowDrift,
                  ),
                ),
              ),
            ],
          ),
          const MVSpacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  now.toDDMMMDay,
                  style: const TextStyle(
                    fontSize: LayoutConstants.dimen_14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.snowDrift,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
