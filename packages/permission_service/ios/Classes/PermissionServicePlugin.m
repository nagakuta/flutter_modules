#import "PermissionServicePlugin.h"
#if __has_include(<permission_service/permission_service-Swift.h>)
#import <permission_service/permission_service-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "permission_service-Swift.h"
#endif

@implementation PermissionServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPermissionServicePlugin registerWithRegistrar:registrar];
}
@end
