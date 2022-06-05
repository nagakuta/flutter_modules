//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <auth_service/auth_service_plugin.h>
#include <crashlytics_service/crashlytics_service_plugin.h>
#include <firebase_service/firebase_service_plugin.h>
#include <package_info_service/package_info_service_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) auth_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AuthServicePlugin");
  auth_service_plugin_register_with_registrar(auth_service_registrar);
  g_autoptr(FlPluginRegistrar) crashlytics_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CrashlyticsServicePlugin");
  crashlytics_service_plugin_register_with_registrar(crashlytics_service_registrar);
  g_autoptr(FlPluginRegistrar) firebase_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FirebaseServicePlugin");
  firebase_service_plugin_register_with_registrar(firebase_service_registrar);
  g_autoptr(FlPluginRegistrar) package_info_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PackageInfoServicePlugin");
  package_info_service_plugin_register_with_registrar(package_info_service_registrar);
}
