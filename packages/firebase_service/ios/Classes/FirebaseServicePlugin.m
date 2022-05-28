#import "FirebaseServicePlugin.h"
#if __has_include(<firebase_service/firebase_service-Swift.h>)
#import <firebase_service/firebase_service-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "firebase_service-Swift.h"
#endif

@implementation FirebaseServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFirebaseServicePlugin registerWithRegistrar:registrar];
}
@end
