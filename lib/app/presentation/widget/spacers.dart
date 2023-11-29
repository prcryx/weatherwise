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

class XSVSpacer extends StatelessWidget {
  const XSVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: LayoutConstants.dimen_4,
    );
  }
}

class LHSpacer extends StatelessWidget {
  const LHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: LayoutConstants.dimen_32,
    );
  }
}

class RHSpacer extends StatelessWidget {
  const RHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: LayoutConstants.dimen_16,
    );
  }
}

class MHSpacer extends StatelessWidget {
  const MHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: LayoutConstants.dimen_8,
    );
  }
}

class XSHSpacer extends StatelessWidget {
  const XSHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: LayoutConstants.dimen_4,
    );
  }
}

class TextSeperators {
  static TextSpan textSpanSpacer(int unit) {
    return TextSpan(
      text: " " * unit,
    );
  }

  static TextSpan textSpanPipe(int spacers) {
    return TextSpan(children: [
      textSpanSpacer(spacers),
      const TextSpan(text: "|"),
      textSpanSpacer(spacers),
    ]);
  }
}
