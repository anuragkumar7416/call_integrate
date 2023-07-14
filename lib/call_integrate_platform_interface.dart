import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'call_integrate_method_channel.dart';

abstract class CallIntegratePlatform extends PlatformInterface {
  /// Constructs a CallIntegratePlatform.
  CallIntegratePlatform() : super(token: _token);

  static final Object _token = Object();

  static CallIntegratePlatform _instance = MethodChannelCallIntegrate();

  /// The default instance of [CallIntegratePlatform] to use.
  ///
  /// Defaults to [MethodChannelCallIntegrate].
  static CallIntegratePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CallIntegratePlatform] when
  /// they register themselves.
  static set instance(CallIntegratePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
