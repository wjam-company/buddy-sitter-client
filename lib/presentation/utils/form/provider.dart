import 'package:flutter/material.dart';
import './validation_item.dart';

typedef FormValidator = ValidationItem Function(
    ValidationItem prevValidation, String value);

class FormProvider extends ChangeNotifier {
  late Map<String, ValidationItem> entries;

  final List<FormError> _errors = [];

  FormProvider(final List<String> keyOfEntries) {
    entries = keyOfEntries.asMap().map<String, ValidationItem>(
        (key, value) => MapEntry(value, ValidationItem()));
  }

  TextEditingController valid(
    final String entry, {
    FormValidator? validator,
    List<FormValidator>? validators,
  }) {
    final TextEditingController _controller = TextEditingController();

    assert(validator != null || validators != null,
        "your need defined any validation of entry!!");
    assert(entries.containsKey(entry),
        "Your need defined a entry that exist in entries!!");
    if (validator != null) {
      validators = [validator];
    }
    ValidationItem valid = entries[entry] as ValidationItem;
    _controller.addListener(() {
      valid.errors.clear();
      final String value = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: value,
        selection:
            TextSelection(baseOffset: value.length, extentOffset: value.length),
        composing: TextRange.empty,
      );
      validators?.forEach((validator) {
        valid = validator(valid, value);
      });

      if (valid.errors.isEmpty) {
        valid = ValidationItem(value: value);
      }

      entries[entry] = valid;
      notifyListeners();
    });
    return _controller;
  }

  Map<String, ValidationItem> get errors => Map.unmodifiable(entries);
}
