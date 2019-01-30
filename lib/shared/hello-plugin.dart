import 'dart:async';

import 'package:flutter/services.dart';

class HelloPluginDemo {
  static const platform = const MethodChannel('phoenix.flutter.io/info');
  static Future<String> sayHelloToNative() async =>
      await platform.invokeMethod('hello');
}
