import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:battery_level_plugin/battery_level_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _batteryLevel = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getBatteryLevel() async {
    String batteryLevel;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      batteryLevel = await BatteryLevelPlugin.batteryLevel;
    } on PlatformException catch (e) {
      batteryLevel = 'Failed to get battery level: ${e.message}';
    }

    if (!mounted) return;

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('Get battery level'), onPressed: getBatteryLevel),
              Text('Battery level: $_batteryLevel\n'),
            ],
          ),
        ),
      ),
    );
  }
}
