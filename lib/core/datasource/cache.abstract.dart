import 'dart:convert';

import 'package:tdd_example/core/vendors/shared-pref.dart';

abstract class Cache<T> {
  Future<void> setData(String key, T val);
  T getData(String key);
  Future<void> delData(String key);
}
