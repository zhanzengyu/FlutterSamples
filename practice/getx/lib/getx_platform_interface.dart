import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'getx_method_channel.dart';

abstract class GetxPlatform extends PlatformInterface {
  /// Constructs a GetxPlatform.
  GetxPlatform() : super(token: _token);

  static final Object _token = Object();

  static GetxPlatform _instance = MethodChannelGetx();

  /// The default instance of [GetxPlatform] to use.
  ///
  /// Defaults to [MethodChannelGetx].
  static GetxPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GetxPlatform] when
  /// they register themselves.
  static set instance(GetxPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
