import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderOnboarding with ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }
}
