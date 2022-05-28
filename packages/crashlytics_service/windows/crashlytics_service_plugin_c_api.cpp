#include "include/crashlytics_service/crashlytics_service_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "crashlytics_service_plugin.h"

void CrashlyticsServicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  crashlytics_service::CrashlyticsServicePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
