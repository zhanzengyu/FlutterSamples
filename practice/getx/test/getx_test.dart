import 'package:flutter_test/flutter_test.dart';
import 'package:getx/getx.dart';
import 'package:getx/getx_platform_interface.dart';
import 'package:getx/getx_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGetxPlatform
    with MockPlatformInterfaceMixin
    implements GetxPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GetxPlatform initialPlatform = GetxPlatform.instance;

  test('$MethodChannelGetx is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGetx>());
  });

  test('getPlatformVersion', () async {
    Getx getxPlugin = Getx();
    MockGetxPlatform fakePlatform = MockGetxPlatform();
    GetxPlatform.instance = fakePlatform;

    expect(await getxPlugin.getPlatformVersion(), '42');
  });
}
