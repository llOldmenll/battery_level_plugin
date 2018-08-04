import Flutter
import UIKit
    
public class SwiftBatteryLevelPlugin: NSObject, FlutterPlugin {
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery_level_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftBatteryLevelPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "getBatteryLevel"){
        self.receiveBatteryLevel(result: result)
    } else {
        result(FlutterMethodNotImplemented);
    }
  }
    
    private func receiveBatteryLevel(result: FlutterResult){
        let device = UIDevice.current;
        device.isBatteryMonitoringEnabled = true;
        if(device.batteryState == UIDeviceBatteryState.unknown){
            result(FlutterError.init(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil));
        } else {
            result(Int(device.batteryLevel * 100));
        }
    }
}
