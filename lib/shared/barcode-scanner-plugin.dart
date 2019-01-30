import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarcodeScannerPlugin {
  BarcodeScannerPlugin({Key key}) {
    platform.setMethodCallHandler(_handleMethod);
  }
  static const platform = const MethodChannel('phoenix.flutter.io/info');
  static Future<String> scan() async =>
      await platform.invokeMethod('scanBarcode');

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "message":
        debugPrint(call.arguments);
        return new Future.value("");
    }
  }
}
