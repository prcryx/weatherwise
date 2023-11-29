import 'package:flutter/material.dart';

import '../../../constants/layout_constants.dart';
import 'primary_container.dart';

class ForcastList extends StatelessWidget {
  const ForcastList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: LayoutConstants.dimen_156,
      child: PageView.builder(
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (
            context,
            i,
          ) {
            return const PrimaryContainer();
          }),
    );
  }
}
