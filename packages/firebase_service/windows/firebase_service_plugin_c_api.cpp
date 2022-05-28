#include "include/firebase_service/firebase_service_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "firebase_service_plugin.h"

void FirebaseServicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  firebase_service::FirebaseServicePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
