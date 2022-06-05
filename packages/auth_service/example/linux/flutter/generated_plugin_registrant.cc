//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <auth_service/auth_service_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) auth_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AuthServicePlugin");
  auth_service_plugin_register_with_registrar(auth_service_registrar);
}
