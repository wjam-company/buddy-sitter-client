import 'package:flutter/material.dart';
import './validation_item.dart';

typedef FormValidator = ValidationItem Function(
    ValidationItem prevValidation, String value);

class FormProvider extends ChangeNotifier {
  late Map<String, ValidationItem> entries;

  FormProvider(final List<String> keyOfEntries) {
    entries = keyOfEntries.asMap().map<String, ValidationItem>(
        (key, value) => MapEntry(value, ValidationItem()));
  }

  TextEditingController Function() valid(
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

    String preValue = _controller.text;
    return () {
      _controller.addListener(() {
        if (preValue == _controller.text) {
          return;
        }
        final String value = preValue = _controller.text;
        _controller.value = TextEditingValue(
          text: value,
          selection: TextSelection(
            baseOffset: value.length,
            extentOffset: value.length,
          ),
          composing: TextRange.empty,
        );

        ValidationItem valid = ValidationItem();

        if (value.isNotEmpty) {
          validators?.forEach((validator) {
            valid = validator(valid, value);
          });

          if (valid.errors.isEmpty) {
            valid = ValidationItem(value: value);
          }
        }

        entries[entry] = valid;
        notifyListeners();
      });

      return _controller;
    };
  }

  Map<String, ValidationItem> get errors => Map.unmodifiable(entries);
}
