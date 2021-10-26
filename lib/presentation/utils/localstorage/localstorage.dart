import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuddySitterStorage<T> extends ChangeNotifier {
  Future<SharedPreferences>? _storage;
  late String _key;
  final String _prefix = 'BuddySitter';
  final List<T> _data = [];

  BuddySitterStorage({required type, required T initial}) : super() {
    _key = '${_prefix}_$type';
    _storage = SharedPreferences.getInstance();
    _data.add(initial);
  }

  T syncGet() => _data.last;

  Future<T?> get() async {
    try {
      late T? data;
      if (T is int) {
        data = (await _storage)?.getInt(_key) as T?;
      } else if (T == double) {
        data = (await _storage)?.getDouble(_key) as T?;
      } else if (T == bool) {
        data = (await _storage)?.getBool(_key) as T?;
      } else if (T == String) {
        data = (await _storage)?.getString(_key) as T?;
      } else if (T == List) {
        data = (await _storage)?.getStringList(_key) as T?;
      }
      if (data != null) {
        _data.add(data);
      }
      return syncGet();
    } catch (_) {
      return null;
    }
  }

  Future<void> set(T value, {bool notify = true}) async {
    try {
      if (T == int) {
        _data.add(value);
        (await _storage)?.setInt(_key, value as int);
      }
      if (T == double) {
        _data.add(value);
        (await _storage)?.setDouble(_key, value as double);
      }
      if (T == bool) {
        _data.add(value);
        (await _storage)?.setBool(_key, value as bool);
      }
      if (T == String) {
        _data.add(value);
        (await _storage)?.setString(_key, value as String);
      }
      if (T == List) {
        _data.add(value);
        (await _storage)?.setStringList(_key, value as List<String>);
      }
      if (notify) {
        notifyListeners();
      }
    } catch (_) {
      return;
    }
  }

  Future<void> update(T value, {bool notify = true}) async {
    try {
      if (T == int) {
        _data.add(value);
        (await _storage)?.setInt(_key, value as int);
      }
      if (T == double) {
        _data.add(value);
        (await _storage)?.setDouble(_key, value as double);
      }
      if (T == bool) {
        _data.add(value);
        (await _storage)?.setBool(_key, value as bool);
      }
      if (T == String) {
        _data.add(value);
        (await _storage)?.setString(_key, value as String);
      }
      if (T == List) {
        _data.add(value);
        (await _storage)?.setStringList(_key, value as List<String>);
      }
      if (notify) {
        notifyListeners();
      }
    } catch (_) {
      return;
    }
  }
}
