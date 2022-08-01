//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <crashlytics_service/crashlytics_service_plugin_c_api.h>
#include <firebase_service/firebase_service_plugin_c_api.h>
#include <gallery_service/gallery_service_plugin_c_api.h>
#include <package_info_service/package_info_service_plugin_c_api.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <permission_service/permission_service_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CrashlyticsServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CrashlyticsServicePluginCApi"));
  FirebaseServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FirebaseServicePluginCApi"));
  GalleryServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("GalleryServicePluginCApi"));
  PackageInfoServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PackageInfoServicePluginCApi"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
  PermissionServicePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionServicePluginCApi"));
}
