import 'package:flutter/material.dart';

import '../../../constants/layout_constants.dart';
import '../themes/custom_theme.dart';
import 'primary_container.dart';

class BlockTitle extends StatelessWidget {
  final String title;
  const BlockTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Text(
        title,
        style: TextStyle(
          fontSize: LayoutConstants.dimen_16,
          fontWeight: FontWeight.bold,
          color:
              Theme.of(context).extension<CustomColorTheme>()!.primaryTextColor,
        ),
      ),
    );
  }
}
