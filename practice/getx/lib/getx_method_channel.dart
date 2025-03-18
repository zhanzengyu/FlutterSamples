import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'getx_platform_interface.dart';

/// An implementation of [GetxPlatform] that uses method channels.
class MethodChannelGetx extends GetxPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('getx');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
