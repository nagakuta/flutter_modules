#import "AuthServicePlugin.h"
#if __has_include(<auth_service/auth_service-Swift.h>)
#import <auth_service/auth_service-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "auth_service-Swift.h"
#endif

@implementation AuthServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAuthServicePlugin registerWithRegistrar:registrar];
}
@end
