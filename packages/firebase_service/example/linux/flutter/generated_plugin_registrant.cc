//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <firebase_service/firebase_service_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) firebase_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FirebaseServicePlugin");
  firebase_service_plugin_register_with_registrar(firebase_service_registrar);
}
