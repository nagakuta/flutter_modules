//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <permission_service/permission_service_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) permission_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PermissionServicePlugin");
  permission_service_plugin_register_with_registrar(permission_service_registrar);
}
