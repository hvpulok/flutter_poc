import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color loginGradientStart = const Color(0xFF8e24aa);
  static const Color loginGradientEnd = const Color(0xFF283593);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, .5],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  );
}
