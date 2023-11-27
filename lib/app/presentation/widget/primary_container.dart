import 'package:flutter/material.dart';
import 'package:weatherwise/constants/layout_constants.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget? child;
  const PrimaryContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: LayoutConstants.dimen_16),
      child: child,
    );
  }
}
