#import "PackageInfoServicePlugin.h"
#if __has_include(<package_info_service/package_info_service-Swift.h>)
#import <package_info_service/package_info_service-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "package_info_service-Swift.h"
#endif

@implementation PackageInfoServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPackageInfoServicePlugin registerWithRegistrar:registrar];
}
@end
