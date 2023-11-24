import 'package:flutter/widgets.dart';

import '../../../constants/layout_constants.dart';

class LVSpacer extends StatelessWidget {
  const LVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: LayoutConstants.dimen_32,
    );
  }
}

class RVSpacer extends StatelessWidget {
  const RVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: LayoutConstants.dimen_16,
    );
  }
}
class MVSpacer extends StatelessWidget {
  const MVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: LayoutConstants.dimen_8,
    );
  }
}

class XSSpacer extends StatelessWidget {
  const XSSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: LayoutConstants.dimen_4,
    );
  }
}
