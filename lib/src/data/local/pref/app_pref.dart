import 'dart:convert';

import 'package:flutter_clean_architecture/src/data/local/pref/pref_helper.dart';
import 'package:flutter_clean_architecture/src/data/model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs extends PrefHelper {
  static const String firstRunKey = 'first_run_key';
  static const String tokenKey = 'token_key';
  static const String userKey = 'user_key';

  @override
  Future<bool> firstRun() async {
    final _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool(firstRunKey) ?? true;
  }

  @override
  Future<void> setFirstRun(bool isFirstRun) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setBool(firstRunKey, isFirstRun);
  }

  @override
  Future<String?> getToken() async {
    final _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(tokenKey);
  }

  @override
  Future setToken(String token) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(tokenKey, token);
  }

  @override
  Future<UserDataModel?> getUserSaved() async {
    final _preferences = await SharedPreferences.getInstance();
    final userJson = _preferences.getString(userKey);
    if (userJson != null) {
      try {
        return UserDataModel.fromJson(jsonDecode(userJson));
      } on Exception {
        return null;
      }
    }

    return const UserDataModel(username: 'hoanbn88', password: '123');
  }

  @override
  Future saveUser(UserDataModel user) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(userKey, user.toJson().toString());
  }
}