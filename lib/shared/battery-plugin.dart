import 'dart:async';

import 'package:flutter/services.dart';

class BatteryLevelPlugin {
  static const platform = const MethodChannel('phoenix.flutter.io/info');
  static Future<String> getBatteryLevel() async =>
      await platform.invokeMethod('getBatteryLevel');
}
