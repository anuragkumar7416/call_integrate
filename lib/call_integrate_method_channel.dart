import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'call_integrate_platform_interface.dart';

/// An implementation of [CallIntegratePlatform] that uses method channels.
class MethodChannelCallIntegrate extends CallIntegratePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('call_integrate');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
