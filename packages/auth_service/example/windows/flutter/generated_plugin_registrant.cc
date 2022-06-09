//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <auth_service/auth_service_plugin_c_api.h>
#include <crashlytics_service/crashlytics_service_plugin_c_api.h>
#include <firebase_service/firebase_service_plugin_c_api.h>
#include <package_info_service/package_info_service_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  AuthServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("AuthServicePluginCApi"));
  CrashlyticsServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CrashlyticsServicePluginCApi"));
  FirebaseServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FirebaseServicePluginCApi"));
  PackageInfoServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PackageInfoServicePluginCApi"));
}
