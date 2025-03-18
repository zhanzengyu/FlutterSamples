
import 'getx_platform_interface.dart';

class Getx {
  Future<String?> getPlatformVersion() {
    return GetxPlatform.instance.getPlatformVersion();
  }
}
