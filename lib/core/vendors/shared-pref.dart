import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefs {
  Future<void> setData(String key, String val);
  String getData(String key);
  Future<void> delData(String key);
}

class SharedPrefsImpl implements SharedPrefs {
  final SharedPreferences _sharedPreferences;

  const SharedPrefsImpl(this._sharedPreferences);

  @override
  Future<void> delData(String key) async {
    await this._sharedPreferences.remove(key);
    return;
  }

  @override
  String getData(String key) {
    return this._sharedPreferences.getString(key);
  }

  @override
  Future<void> setData(String key, String value) async {
    await this._sharedPreferences.setString(key, value);
    return;
  }
}
