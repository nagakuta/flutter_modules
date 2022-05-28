//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <crashlytics_service/crashlytics_service_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) crashlytics_service_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CrashlyticsServicePlugin");
  crashlytics_service_plugin_register_with_registrar(crashlytics_service_registrar);
}
