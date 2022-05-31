//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <package_info_service/package_info_service_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) package_info_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PackageInfoServicePlugin");
  package_info_service_plugin_register_with_registrar(package_info_service_registrar);
}
