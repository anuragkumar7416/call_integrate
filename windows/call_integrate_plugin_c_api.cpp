#include "include/call_integrate/call_integrate_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "call_integrate_plugin.h"

void CallIntegratePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  call_integrate::CallIntegratePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
