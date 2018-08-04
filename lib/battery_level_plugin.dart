import 'dart:async';

import 'package:flutter/services.dart';

class BatteryLevelPlugin {
  static const MethodChannel _channel =
      const MethodChannel('battery_level_plugin');

  static Future<String> get batteryLevel async {
    String _batteryLevel = 'Unknown battery level.';

    try {
      final int batteryLevel = await _channel.invokeMethod('getBatteryLevel');
      _batteryLevel = 'Battery level at $batteryLevel % .';
    } on PlatformException catch (e) {
      _batteryLevel = 'Failed to get battery level: ${e.message}';
    }
    return _batteryLevel;
  }
}
