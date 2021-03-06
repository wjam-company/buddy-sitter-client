import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuddySitterStorage extends ChangeNotifier {
  Future<SharedPreferences>? _storage;
  late String _key;
  final String _prefix = 'BuddySitter';
  final Map<dynamic, dynamic> _data = {};

  BuddySitterStorage({required type, required Map initial}) : super() {
    _key = '${_prefix}_$type';
    _storage = SharedPreferences.getInstance();
    get().then((value) {
      if (value == null) {
        set(initial);
      }
    });
  }

  Map syncGet() => _data;

  Future<Map?> get() async {
    try {
      late Map? data;
      String? s = (await _storage)?.getString(_key);
      if (s == null) {
        return syncGet();
      }

      data = jsonDecode(s);
      if (data != null) {
        _data.addAll(data);
      }
      return syncGet();
    } catch (e) {
      throw Error();
    }
  }

  Future<void> set(Map value, {bool notify = true}) async {
    try {
      _data.addAll(value);
      (await _storage)?.setString(_key, jsonEncode(_data));
      if (notify) {
        notifyListeners();
      }
    } catch (_) {
      return;
    }
  }

  Future<void> setKey(String key, dynamic value) async {
    _data[key] = value;
    set(_data);
  }

  Future<void> updateKey(String key, Map value) async {
    var data = _data[key];
    data.addAll(value);
    _data[key] = data;
    set(_data);
  }

  Future<void> removeKey(String key) async {
    _data.remove(key);
    set(_data);
  }

  Future<void> removeKeys(List<String> keys) async {
    for (var key in keys) {
      _data.remove(key);
      set(_data);
    }
  }

  Future<void> clear() async {
    try {
      _data.clear();
      (await _storage)?.setString(_key, jsonEncode(_data));
      notifyListeners();
    } catch (_) {
      return;
    }
  }
}
