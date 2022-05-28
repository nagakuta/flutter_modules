#import "CrashlyticsServicePlugin.h"
#if __has_include(<crashlytics_service/crashlytics_service-Swift.h>)
#import <crashlytics_service/crashlytics_service-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "crashlytics_service-Swift.h"
#endif

@implementation CrashlyticsServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCrashlyticsServicePlugin registerWithRegistrar:registrar];
}
@end
