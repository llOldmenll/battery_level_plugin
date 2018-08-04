#import "BatteryLevelPlugin.h"
#import <battery_level_plugin/battery_level_plugin-Swift.h>

@implementation BatteryLevelPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBatteryLevelPlugin registerWithRegistrar:registrar];
}
@end
