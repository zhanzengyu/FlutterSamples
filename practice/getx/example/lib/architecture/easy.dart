/// 依赖注入，外部可将实例注入该类中，由该类管理
class Easy {
  /// 注入实例
  static T put<T>(T dependency, {String? tag}) =>
      _EasyInstance().put(dependency, tag: tag);

  /// 获取注入的实例
  static T find<T>({String? tag, String? key}) =>
      _EasyInstance().find<T>(tag: tag, key: key);

  /// 删除实例
  static bool delete<T>({String? tag, String? key}) =>
      _EasyInstance().delete<T>(tag: tag, key: key);
}

/// 单例
class _EasyInstance {
  /// 单例实例
  static _EasyInstance? _instance;

  /// 私有构造函数，防止直接 new
  _EasyInstance._();

  /// 工厂构造函数提供统一的实例获取方式
  factory _EasyInstance() => _instance ??= _EasyInstance._();

  static final Map<String, _InstanceInfo> _single = {};

  /// 获取 key
  String _getKey(Type type, String? tag) {
    return tag == null ? type.toString() : type.toString() + tag;
  }

  /// 获取注入的实例
  T find<T>({String? tag, String? key}) {
    final newKey = key ?? _getKey(T, tag);
    var info = _single[newKey];
    if (info?.value != null) {
      return info!.value;
    } else {
      throw '"$T" not found. You need to call "Easy.put($T())""';
    }
  }

  /// 注入实例
  T put<T>(T dependency, {String? tag}) {
    final key = _getKey(T, tag);
    _single.putIfAbsent(key, () => _InstanceInfo<T>(dependency));
    return find<T>(tag: tag);
  }

  /// 删除实例
  bool delete<T>({String? tag, String? key}) {
    final newKey = key ?? _getKey(T, tag);
    if (!_single.containsKey(newKey)) {
      print('Instance "$newKey" already removed.');
      return false;
    }

    _single.remove(newKey);
    print('Instance "$newKey" deleted.');
    return true;
  }
}

class _InstanceInfo<T> {
  _InstanceInfo(this.value);

  T value;
}
