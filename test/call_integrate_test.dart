import 'package:flutter_test/flutter_test.dart';
import 'package:call_integrate/call_integrate.dart';
import 'package:call_integrate/call_integrate_platform_interface.dart';
import 'package:call_integrate/call_integrate_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCallIntegratePlatform
    with MockPlatformInterfaceMixin
    implements CallIntegratePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CallIntegratePlatform initialPlatform = CallIntegratePlatform.instance;

  test('$MethodChannelCallIntegrate is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCallIntegrate>());
  });

  test('getPlatformVersion', () async {
    CallIntegrate callIntegratePlugin = CallIntegrate();
    MockCallIntegratePlatform fakePlatform = MockCallIntegratePlatform();
    CallIntegratePlatform.instance = fakePlatform;

    expect(await callIntegratePlugin.getPlatformVersion(), '42');
  });
}
